import 'dart:convert';

import 'package:fitcycle/models/apiejercises_images_response.dart';
import 'package:http/http.dart' as http;

class EjerciseimagesApi {
  Future<ApiejercisesImagesResponse> getEjerciseImages() async {
    final response = await http.get(Uri.parse(
        'https://wger.de/api/v2/exerciseimage/?exercise=1&language=4'));
    if (response.statusCode == 200) {
      return ApiejercisesImagesResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falla al cargar los ejercicios');
    }
  }
}
