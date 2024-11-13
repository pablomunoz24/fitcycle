import 'package:fitcycle/models/local_ejercise.dart';
import 'package:hive/hive.dart';

class Boxes{
  static Box<LocalEjercise> getLocalEjerciseBox()=>Hive.box<LocalEjercise>('ejercise');
}