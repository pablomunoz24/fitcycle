import 'dart:io';

import 'package:fitcycle/models/ejercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';

import '../repositorio/firebase_api.dart';

class NewEjercisePage extends StatefulWidget {
  const NewEjercisePage({super.key});

  @override
  State<NewEjercisePage> createState() => _NewEjercisePageState();
}

class _NewEjercisePageState extends State<NewEjercisePage> {
  final FirebaseAppi _firebaseApi = FirebaseAppi();

  final _name = TextEditingController();
  final _duration = TextEditingController();
  final _level = TextEditingController();
  final _intensity = TextEditingController();

  bool _isTroncosuperiorE = false, _isTroncoInferiroE = false, _Lunes = false;
  bool _Martes = false,
      _Miercoles = false,
      _Jueves = false;
  bool _Viernes = false, _Sabado = false;
  bool _Domingo=false;

  Future<void> _saveEjerciseButtonClicked() async {

    var ejercise = Ejercise(
        "",
        _name.text,
        int.parse(_duration.text),
        _isTroncosuperiorE,
        _isTroncoInferiroE,
        _Lunes,
        _Martes,
        _Miercoles,
        _Jueves,
        _Viernes,
        _Sabado,
        _Domingo,
        _level.text,
        _intensity.text,
        "");

    var result = await _firebaseApi.createEjercise(ejercise, image);

    if (result == 'network-request-failed') {
      showMessage('Revise su conexión a internet');
    } else {
      showMessage('Película creada exitosamente');
      Navigator.pop(context);
    }
  }

  void showMessage(String msg) {
    SnackBar snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Película'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                height: 170,
                child: Stack(
                  children: [
                    image != null
                        ? Image.file(image!, width: 150, height: 150)
                        : const Image(
                      image: AssetImage('assets/images/logo.png'),
                      width: 150,
                      height: 150,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        alignment: Alignment.bottomLeft,
                        onPressed: () async {
                          pickImage();
                        },
                        icon: const Icon(Icons.camera_alt),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Nombre'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _duration,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Duración'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 16.0,
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                'Enfoque del ejercicio ',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text('Tronco superior'),
                      value: _isTroncosuperiorE,
                      selected: _isTroncosuperiorE,
                      onChanged: (bool? value) {
                        setState(() {
                          _isTroncosuperiorE = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text('Tronco inferior'),
                      value: _isTroncoInferiroE,
                      selected: _isTroncoInferiroE,
                      onChanged: (bool? value) {
                        setState(() {
                          _isTroncoInferiroE = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                'Dias del ejercicio ',
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text('Lunes'),
                      value: _Lunes,
                      selected: _Lunes,
                      onChanged: (bool? value) {
                        setState(() {
                          _Lunes = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text('Martes'),
                      value: _Martes,
                      selected: _Martes,
                      onChanged: (bool? value) {
                        setState(() {
                          _Martes = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text('Miercoles'),
                      value: _Miercoles,
                      selected: _Miercoles,
                      onChanged: (bool? value) {
                        setState(() {
                          _Miercoles = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text('Jueves'),
                      value: _Jueves,
                      selected: _Jueves,
                      onChanged: (bool? value) {
                        setState(() {
                          _Jueves = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text('Viernes'),
                      value: _Viernes,
                      selected: _Viernes,
                      onChanged: (bool? value) {
                        setState(() {
                          _Viernes = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text('Sabado'),
                      value: _Sabado,
                      selected: _Sabado,
                      onChanged: (bool? value) {
                        setState(() {
                          _Sabado = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  _saveEjerciseButtonClicked();
                },
                child: const Text('Guardar ejericio'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}