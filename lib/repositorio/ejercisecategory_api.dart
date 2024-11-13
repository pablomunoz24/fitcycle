import 'dart:convert';
import 'package:fitcycle/models/apiejercises_images_response.dart';
import 'package:http/http.dart' as http;

import '../models/apiejercises_category_response.dart';

class EjerciseCategoryApi {

  // Método para obtener los ejercicios
  Future<ApiejercisesCategoryResponse> getEjercise() async {
    final response = await http.get(
        Uri.parse('https://wger.de/api/v2/exercise/?exercise=1&language=4'));
    if (response.statusCode == 200) {
      return ApiejercisesCategoryResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falla al cargar los ejercicios');
    }
  }
}
