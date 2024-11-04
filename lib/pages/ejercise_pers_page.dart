import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitcycle/pages/new_ejercise_page.dart';
import 'package:flutter/material.dart';

import '../repositorio/firebase_api.dart';

class EjercisePersPage extends StatefulWidget {
  const EjercisePersPage({super.key});

  @override
  State<EjercisePersPage> createState() => _EjercisePersPageState();
}

class _EjercisePersPageState extends State<EjercisePersPage> {
  final FirebaseAppi _firebaseApi = FirebaseAppi();

  void _addButtonClicked() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const NewEjercisePage()));
  }

  void _deleteEjercise(QueryDocumentSnapshot ejercise) async {
    var result = await _firebaseApi.deleteEjercise(ejercise);
    if (result == 'network-request-failed') {
      _showMessage('Revise su conexión a internet');
    }else {
      _showMessage('Pelicula eliminada con éxito');
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
      content:
      Text("¿Está seguro que desea eliminar el ejercicio  ${ejercise['name']}?"),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: Text('Cancelar')),
        TextButton(
            child: Text('Aceptar'),
            onPressed: () => {
              _deleteEjercise(ejercise),
              Navigator.pop(context, 'OK'),
            }),
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
              leading: Image.network(
                ejercise['urlPicture'] ?? "",
              ),
            ),
            /*    Container(
              height: 100.0,
              width: 100.0,
              child: Ink.image(
                image: ejercise['urlPicture'] == ""
                    ? const AssetImage('assets/images/logo.png')
                        as ImageProvider
                    : NetworkImage(ejercise['urlPicture']),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),*/
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("ejercises").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Text("Loading");
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    QueryDocumentSnapshot ejercise = snapshot.data!.docs[index];
                    return _buildCard(ejercise);
                  });
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addButtonClicked,
        child: const Icon(Icons.add),
      ),
    );
  }
}