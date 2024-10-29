import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/user.dart';
import '../repositorio/firebase_api.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Genre { male, female }

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAppi _firebaseApi = FirebaseAppi();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repPassword = TextEditingController();
  final _city = TextEditingController();
  final _weight = TextEditingController();

  bool _isPasswordObscure = true;
  bool _isRepPasswordObscure = true;

  Genre? _genre = Genre.male;
  bool _isTroncosuperiorF = false;
  bool _isTroncoInferiro = false;
  bool _isCardio = false;
  final _level = TextEditingController();

  String buttonMsg = "Fecha de Nacimiento";

  DateTime _data = DateTime.now();

  final List<String> _cities = [
    'Barranquilla',
    'Bogotá',
    'Cali',
    'Medellin',
    'Pereira'
  ];
  final List<String> _levels = [
    'Principiante',
    'Intermedio',
    'Avanzado'
  ];

  String _dateConverter(DateTime newDate) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String dateFormatted = formatter.format(newDate);
    return dateFormatted;
  }

  void _showSelectedDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      locale: const Locale("es", "CO"),
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
      helpText: "Fecha de Nacimiento",
    );
    if (newDate != null) {
      setState(() {
        _data = newDate;
        buttonMsg = "Fecha de nacimiento ${_dateConverter(_data)}";
      });
    }
  }

  void _showMessage(String msg) {
    setState(() {
      SnackBar snackBar = SnackBar(content: Text(msg));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
  void _createUserInDB(User user)async{
    var result= await _firebaseApi.createUserInDB(user);
    if (result=='network-request-failed'){
      _showMessage('Revise su conexión a internet');
    }
    else {
      _showMessage('Usuario registrado con éxito');
      Navigator.pop(context);
    }
  }

  void _createUser(User user) async {

    var result = await _firebaseApi.createUser(user.email, user.password);

    if (result == 'invalid-email') {
      _showMessage('El correo electrónico está mal escrito');
    } else if (result == 'email-already-in-use') {
      _showMessage('Ya existe una cuenta con ese correo electrónico');
    } else if (result == 'weak-password') {
      _showMessage('La contraseña debe tener mínimo 6 dígitos');
    } else if (result == 'network-request-failed') {
      _showMessage('Revise su conexión a internet');
    } else {
      user.uid = result!;
      _createUserInDB(user);
    }
  }

  void _onRegisterButtonClicked() {
    if (_email.text.isEmpty || _password.text.isEmpty) {
      _showMessage("ERROR: Debe digitar correo electrónico y contraseña");
    } else if (_password.text != _repPassword.text) {
      _showMessage("ERROR: Las contraseñas deben de ser iguales");
    } else {
      String genre = _genre == Genre.male ? "Masculino" : "Femenino";
      var user = User(
          "",
          _name.text,
          _email.text,
          _password.text,
          _weight.text,
          genre,
          _isTroncosuperiorF,
          _isTroncoInferiro,
          _isCardio,
          _level.text,
          _data.toString(),
          _city.text);
      _createUser(user);

      /* code */
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/fitcycle.png'),
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _name,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Digite su nombre",
                      prefixIcon: Icon(Icons.person)),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Digite su correo electrónico",
                        helperText: "*Campo obligatorio",
                        prefixIcon: Icon(Icons.email)),
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                    value!.isValidEmail() ? null : "Correo inválido"),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                    controller: _password,
                    obscureText: _isPasswordObscure,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Digite su contraseña",
                      helperText: "*Campo obligatorio",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                          icon: Icon(_isPasswordObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isPasswordObscure = !_isPasswordObscure;
                            });
                          }),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value!.isPasswordValid()
                        ? null
                        : "La contraseña debe tener mínimo 6 caracteres"),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _repPassword,
                  obscureText: _isRepPasswordObscure,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Repita la contraseña",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                        icon: Icon(_isRepPasswordObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isRepPasswordObscure = !_isRepPasswordObscure;
                          });
                        }),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _weight,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Digite su peso en Kg",
                      prefixIcon: Icon(Icons.accessibility)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                DropdownMenu<String>(
                  width: 380,
                  enableFilter: true,
                  requestFocusOnTap: true,
                  label: const Text('Ciudad de residencia'),
                  onSelected: (String? city) {
                    setState(() {
                      _city.text = city!;
                    });
                  },
                  dropdownMenuEntries:
                  _cities.map<DropdownMenuEntry<String>>((String city) {
                    return DropdownMenuEntry<String>(value: city, label: city);
                  }).toList(),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                DropdownMenu<String>(
                  width: 380,
                  enableFilter: true,
                  requestFocusOnTap: true,
                  label: const Text('Indique su nivel de entrenamiento'),
                  onSelected: (String? level) {
                    setState(() {
                      _level.text = level!;
                    });
                  },
                  dropdownMenuEntries:
                  _levels.map<DropdownMenuEntry<String>>((String level) {
                    return DropdownMenuEntry<String>(value: level, label: level);
                  }).toList(),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text("Seleccione su género"),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text("Masculino"),
                        leading: Radio<Genre>(
                          value: Genre.male,
                          groupValue: _genre,
                          onChanged: (Genre? value) {
                            setState(() {
                              _genre = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text("Femenino",
                            style: const TextStyle(
                              fontSize: 16,
                            )),
                        leading: Radio<Genre>(
                          value: Genre.female,
                          groupValue: _genre,
                          onChanged: (Genre? value) {
                            setState(() {
                              _genre = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const Text("Enfoque del ejercicio"),
                CheckboxListTile(
                    title: const Text("Tronco Superior"),
                    value: _isTroncosuperiorF,
                    selected: _isTroncosuperiorF,
                    onChanged: (bool? value) {
                      setState(() {
                        _isTroncosuperiorF = value!;
                      });
                    }),
                CheckboxListTile(
                    title: const Text("Tronco Inferior"),
                    value: _isTroncoInferiro,
                    selected: _isTroncoInferiro,
                    onChanged: (bool? value) {
                      setState(() {
                        _isTroncoInferiro = value!;
                      });
                    }),
                CheckboxListTile(
                    title: const Text("Cardio"),
                    value: _isCardio,
                    selected: _isCardio,
                    onChanged: (bool? value) {
                      setState(() {
                        _isCardio = value!;
                      });
                    }),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                    child: Text(buttonMsg),
                    onPressed: () {
                      _showSelectedDate();
                    }),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      _onRegisterButtonClicked();
                    },
                    child: const Text("Registrar")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension on String {
  bool isPasswordValid() {
    return this.length > 5;
  }
}