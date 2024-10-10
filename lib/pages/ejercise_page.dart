import 'package:flutter/material.dart';

class EjercisePage extends StatefulWidget {
  const EjercisePage({super.key});

  @override
  State<EjercisePage> createState() => _EjercisePageState();
}

class _EjercisePageState extends State<EjercisePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text('Ejercicio')
      ),
    );
  }
}
