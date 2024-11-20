import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import '../models/ejercise.dart';

class CronoPage extends StatefulWidget {
  final String initialDay;

  const CronoPage({
    super.key,
    required this.initialDay,
  });

  @override
  State<CronoPage> createState() => _CronoPageState();
}

class _CronoPageState extends State<CronoPage> {
  late String selectedDay;
  int? currentExerciseIndex;
  Timer? _timer;
  int _seconds = 0;
  bool _isRunning = false;

  final Map<String, String> daysInSpanish = {
    'Lunes': 'Lunes',
    'Martes': 'Martes',
    'Miércoles': 'Miércoles',
    'Jueves': 'Jueves',
    'Viernes': 'Viernes',
    'Sábado': 'Sábado',
    'Domingo': 'Domingo',
  };

  @override
  void initState() {
    super.initState();
    selectedDay = widget.initialDay;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer(int duration) {
    _timer?.cancel();
    setState(() {
      _seconds = duration * 60;
      _isRunning = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _timer?.cancel();
          _isRunning = false;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('¡Tiempo completado!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      });
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  void _resetTimer(int duration) {
    _timer?.cancel();
    setState(() {
      _seconds = duration * 60;
      _isRunning = false;
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cronómetro de Ejercicios'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              value: selectedDay,
              decoration: const InputDecoration(
                labelText: 'Selecciona el día',
                border: OutlineInputBorder(),
              ),
              items: daysInSpanish.keys.map((String day) {
                return DropdownMenuItem<String>(
                  value: day,
                  child: Text(daysInSpanish[day]!),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedDay = newValue;
                    currentExerciseIndex = null;
                    _timer?.cancel();
                    _isRunning = false;
                  });
                }
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(FirebaseAuth.instance.currentUser?.uid)
                  .collection("ejercises")
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                List<Ejercise> exercises = snapshot.data!.docs
                    .map((doc) => Ejercise.fromFirestore(doc))
                    .where((exercise) {
                  switch (selectedDay) {
                    case 'Lunes':
                      return exercise.Lunes;
                    case 'Martes':
                      return exercise.Martes;
                    case 'Miércoles':
                      return exercise.Miercoles;
                    case 'Jueves':
                      return exercise.Jueves;
                    case 'Viernes':
                      return exercise.Viernes;
                    case 'Sábado':
                      return exercise.Sabado;
                    case 'Domingo':
                      return exercise.Domingo;
                    default:
                      return false;
                  }
                }).toList();

                if (exercises.isEmpty) {
                  return Center(
                    child: Text('No hay ejercicios programados para ${daysInSpanish[selectedDay]}'),
                  );
                }

                return Column(
                  children: [
                    if (currentExerciseIndex != null) ...[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  exercises[currentExerciseIndex!].name,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  _formatTime(_seconds),
                                  style: const TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: _isRunning
                                          ? _pauseTimer
                                          : () => _startTimer(
                                          exercises[currentExerciseIndex!].duration),
                                      child: Icon(
                                        _isRunning ? Icons.pause : Icons.play_arrow,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    ElevatedButton(
                                      onPressed: () => _resetTimer(
                                          exercises[currentExerciseIndex!].duration),
                                      child: const Icon(Icons.restart_alt),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                    Expanded(
                      child: ListView.builder(
                        itemCount: exercises.length,
                        itemBuilder: (context, index) {
                          final exercise = exercises[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 4.0,
                            ),
                            child: ListTile(
                              title: Text(exercise.name),
                              subtitle: Text('Duración: ${exercise.duration} minutos'),
                              selected: currentExerciseIndex == index,
                              onTap: () {
                                setState(() {
                                  currentExerciseIndex = index;
                                  _resetTimer(exercise.duration);
                                });
                              },
                              leading: const Icon(Icons.fitness_center),
                              trailing: const Icon(Icons.timer),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}