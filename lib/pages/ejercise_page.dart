import 'package:flutter/material.dart';

import 'ejercise_pers_page.dart';

class EjercisePage extends StatefulWidget {
  const EjercisePage({super.key});

  @override
  State<EjercisePage> createState() => _EjercisePageState();
}

class _EjercisePageState extends State<EjercisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Image(
                  image: AssetImage('assets/images/fitcycle.png'),
                  width: 180,
                  height: 150,
                ),
                const SizedBox(
                  height: 100.0, // Espacio vacío entre las imágenes
                ),
                   Material(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(28),
                    elevation: 8,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Colors.black26, // Color de la animación splash
                      borderRadius: BorderRadius.circular(28), // Mantiene el borde redondeado
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=> const EjercisePersPage()));
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Entrenamiento Personalizado',
                              style: TextStyle(
                                fontFamily: 'San Francisco',
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Image(
                            image: AssetImage('assets/images/entrenoper.jpg'),
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100.0, // Espacio vacío entre las imágenes
                ),
                Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(28),
                  elevation: 8,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: Colors.black26, // Color de la animación splash
                    borderRadius: BorderRadius.circular(28), // Mantiene el borde redondeado
                    onTap: () {
                      // Acción cuando se presiona el botón
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '       Entrenamiento del dia       ',
                            style: TextStyle(
                              fontFamily: 'San Francisco',
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Image(
                          image: AssetImage('assets/images/entrenodeld.jpg'),
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );


  }
}