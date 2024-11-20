import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/ejercise.dart';
import './crono_page.dart'; // Asegúrate de tener la importación correcta

class RoutinePage extends StatefulWidget {
  const RoutinePage({super.key});
  @override
  State<RoutinePage> createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  final List<Item> days = [
    Item(header: 'Lunes'),
    Item(header: 'Martes'),
    Item(header: 'Miércoles'),
    Item(header: 'Jueves'),
    Item(header: 'Viernes'),
    Item(header: 'Sábado'),
    Item(header: 'Domingo'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio Diario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .collection("ejercises")
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

            final Map<String, List<Ejercise>> exercisesByDay = {
              'Lunes': [],
              'Martes': [],
              'Miércoles': [],
              'Jueves': [],
              'Viernes': [],
              'Sábado': [],
              'Domingo': [],
            };

            for (var doc in snapshot.data!.docs) {
              Ejercise ejercise = Ejercise.fromFirestore(doc);
              if (ejercise.Lunes) exercisesByDay['Lunes']!.add(ejercise);
              if (ejercise.Martes) exercisesByDay['Martes']!.add(ejercise);
              if (ejercise.Miercoles) exercisesByDay['Miércoles']!.add(ejercise);
              if (ejercise.Jueves) exercisesByDay['Jueves']!.add(ejercise);
              if (ejercise.Viernes) exercisesByDay['Viernes']!.add(ejercise);
              if (ejercise.Sabado) exercisesByDay['Sábado']!.add(ejercise);
              if (ejercise.Domingo) exercisesByDay['Domingo']!.add(ejercise);
            }

            return SingleChildScrollView(
              child: ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    days[index].isExpanded = !days[index].isExpanded;
                  });
                },
                children: days.map<ExpansionPanel>((Item day) {
                  final dayExercises = exercisesByDay[day.header]!;
                  return ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(
                          day.header,
                          style: const TextStyle(fontSize: 20),
                        ),
                      );
                    },
                    body: Column(
                      children: [
                        // Contenido existente
                        dayExercises.isEmpty
                            ? const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text('No hay ejercicios para este día.'),
                        )
                            : Column(
                          children: dayExercises.map((ej) {
                            return ListTile(
                              title: Text(ej.name),
                              subtitle: Text('Duración: ${ej.duration} minutos'),
                            );
                          }).toList(),
                        ),
                        // Botón para ir a CronoPage
                        if (dayExercises.isNotEmpty) // Solo mostrar el botón si hay ejercicios
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CronoPage(
                                      initialDay: day.header,
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.timer),
                              label: const Text('Iniciar Cronómetro'),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    isExpanded: day.isExpanded,
                    canTapOnHeader: true,
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Item {
  final String header;
  bool isExpanded;
  Item({
    required this.header,
    this.isExpanded = false,
  });
}