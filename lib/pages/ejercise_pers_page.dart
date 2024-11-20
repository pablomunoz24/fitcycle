import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repositorio/firebase_api.dart';
import 'new_ejercise_page.dart';

class EjercisePersPage extends StatefulWidget {
  const EjercisePersPage({super.key});

  @override
  State<EjercisePersPage> createState() => _EjercisePersPageState();
}

class _EjercisePersPageState extends State<EjercisePersPage> {
  final FirebaseAppi _firebaseApi = FirebaseAppi();

  void _addButtonClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewEjercisePage()),
    );
  }

  Future<void> _deleteEjercise(QueryDocumentSnapshot ejercise) async {
    // Eliminar de la base de datos
    var result = await _firebaseApi.deleteEjercise(ejercise);
    if (result == 'network-request-failed') {
      _showMessage('Revise su conexión a internet');
    } else {
      _showMessage('Ejercicio eliminado con éxito');

      // Eliminar el estado de favorito usando SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(
          ejercise['name']); // Eliminar el estado de favorito si existe
    }
  }

  void _showMessage(String msg) {
    setState(() {
      SnackBar snackBar = SnackBar(content: Text(msg));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  void _showAlertDialog(QueryDocumentSnapshot ejercise) {
    AlertDialog alert = AlertDialog(
      title: const Text('Advertencia'),
      content: Text(
          "¿Está seguro que desea eliminar el ejercicio ${ejercise['name']}?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancelar'),
        ),
        TextButton(
          child: const Text('Aceptar'),
          onPressed: () async {
            await _deleteEjercise(ejercise);
            Navigator.pop(context, 'OK');
          },
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  InkWell _buildCard(QueryDocumentSnapshot ejercise) {
    return InkWell(
      onTap: () {
        print("clic");
      },
      onLongPress: () {
        print("longClic");
        _showAlertDialog(ejercise);
      },
      child: Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(ejercise['name']),
              subtitle: Text('${ejercise['duration']} segundos'),
              leading: ejercise['urlPicture'] != null &&
                  ejercise['urlPicture']!.isNotEmpty
                  ? Image.network(
                  ejercise['urlPicture']!) // Si hay una URL, se muestra la imagen desde la red
                  : ejercise['isTroncosuperiorF'] ==
                  true // Si no hay URL y es 'Tronco superior'
                  ? Image.asset(
                  'assets/images/Trensup.png') // Imagen predeterminada para 'Tronco superior'
                  : ejercise['isTroncoInferiro'] ==
                  true // Si es 'Tronco inferior'
                  ? Image.asset(
                  'assets/images/Treninf.png') // Imagen predeterminada para 'Tronco inferior'
                  : Image.asset('assets/images/fitcycle.png'),
              // Imagen predeterminada genérica
              trailing: FutureBuilder<bool>(
                future: _isFavorite(ejercise['name']),
                builder: (context, snapshot) {
                  bool isFavorite = snapshot.data ?? false;
                  return Icon(
                    Icons.check_circle_rounded,
                    color: isFavorite ? Colors.blue : Colors.grey,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Verificar si el ejercicio es favorito
  Future<bool> _isFavorite(String name) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(name) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      return const Center(child: Text('Usuario no autenticado.'));
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("users")
          .doc(FirebaseAuth.instance.currentUser?.uid)
              .collection("ejercises")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error al cargar los datos.'));
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                  child: Text('No tienes ejercicios guardados.'));
            } else {
              final exercises = snapshot.data!.docs;
              return ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  final ejercise = exercises[index];
                  return _buildCard(ejercise);
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addButtonClicked,
        child: const Icon(Icons.add),
      ),
    );
  }
}