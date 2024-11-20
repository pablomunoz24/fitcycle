import 'package:fitcycle/models/apiejercises_images_response.dart';
import 'package:fitcycle/repositorio/ejerciseimages_api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/apiejercises_category_response.dart';
import '../repositorio/ejercisecategory_api.dart';
import 'new_ejercise_page.dart';

class ProgresPage extends StatefulWidget {
  const ProgresPage({super.key});

  @override
  State<ProgresPage> createState() => _ProgresPageState();
}

class _ProgresPageState extends State<ProgresPage> {
  final EjerciseimagesApi ejerciseimagesApi = EjerciseimagesApi();
  List<Eimage> listImage = <Eimage>[];
  final EjerciseCategoryApi ejerciseCategoryApi = EjerciseCategoryApi();
  List<Results> listEjercises = <Results>[];

  // Obtener las imágenes de los ejercicios
  Future<void> _getEjerciseImages() async {
  }

  // Obtener los ejercicios
  Future<void> _getEjercise() async {
    var results = await ejerciseCategoryApi.getEjercise();
    setState(() {
      listEjercises = results.results!;
    });
  }

  @override
  void initState() {
    _getEjercise();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView.builder(
              itemCount: listEjercises.length,
              itemBuilder: (BuildContext context, int index) {
                Results ejercise = listEjercises[index];

                // Mostrar la imagen si está disponible, o un marcador de posición
                return Card(
                  child: ListTile(
                    title: Text(ejercise.name!),
                    leading:  const Icon(Icons.image_not_supported),
                    onTap: () {
                      // Navegar a la pantalla de detalles al presionar el ListTile
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExerciseDetailPage(
                            exercise: ejercise,

                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
        ),
      ),
    );
  }
}

// Página de detalles del ejercicio
class ExerciseDetailPage extends StatefulWidget {
  final Results exercise;
  final String? imageUrl;

  const ExerciseDetailPage({
    Key? key,
    required this.exercise,
    this.imageUrl,
  }) : super(key: key);

  @override
  _ExerciseDetailPageState createState() => _ExerciseDetailPageState();
}

class _ExerciseDetailPageState extends State<ExerciseDetailPage> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isFavorite = prefs.getBool(widget.exercise.name ?? '') ?? false;
    });
  }

  Future<void> _toggleFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isFavorite = !_isFavorite;
    });
    if (_isFavorite) {
      await prefs.setBool(widget.exercise.name ?? '', true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NewEjercisePage(
            initialExerciseName: widget.exercise.name,
          ),
        ),
      );
    } else {
      await prefs.remove(widget.exercise.name ?? '');
    }

    print(_isFavorite
        ? "Ejercicio añadido a favoritos"
        : "Ejercicio eliminado de favoritos");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise.name ?? 'Detalle del Ejercicio'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            color: _isFavorite ? Colors.red : Colors.grey,
            onPressed: _toggleFavoriteStatus,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              widget.exercise.name ?? 'Ejercicio',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
                widget.exercise.description
                    ?.replaceAll('<ol>', '')
                    .replaceAll('</ol>', '')
                    .replaceAll('</li>', '')
                    .replaceAll('</p>', '\n')
                    .replaceAll('<p>', '')
                    .replaceAll('<li>', '\n- ')
                    .replaceAll(RegExp(r'[áÁ]'), 'a')
                    .replaceAll(RegExp(r'[é]'), 'e')
                    .replaceAll(RegExp(r'[íÍ]'), 'i')
                    .replaceAll(RegExp(r'[óÓ]'), 'o')
                    .replaceAll(RegExp(r'[úÚ]'), 'u')
                    .replaceAll(RegExp(r'[ñÑ]'), 'n') ?? 'Sin descripción',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
