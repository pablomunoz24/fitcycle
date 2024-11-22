import 'dart:convert';
import 'package:fitcycle/models/apiejercises_images_response.dart';
import 'package:http/http.dart' as http;

import '../models/apiejercises_category_response.dart';

class EjerciseCategoryApi {

  // Método para obtener los ejercicios
  Future<ApiejercisesCategoryResponse> getEjercise() async {
    final response = await http.get(
      Uri.parse('https://wger.de/api/v2/exercise/?exercise=1&language=4'),
    );

    if (response.statusCode == 200) {
      // Decodificar correctamente el cuerpo de la respuesta
      final result = json.decode(utf8.decode(response.bodyBytes));
      // Crear la respuesta usando el JSON decodificado
      return ApiejercisesCategoryResponse.fromJson(result);
    } else {
      throw Exception('Error al cargar los ejercicios');
    }
  }
}
