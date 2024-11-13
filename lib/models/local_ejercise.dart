import 'package:hive/hive.dart';
part 'local_ejercise.g.dart';

@HiveType(typeId:0)
class LocalEjercise extends HiveObject{
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  int? duration;
  @HiveField(3)
  bool? isTroncosuperiorE;
  @HiveField(4)
  bool? isTroncoInferiroE;
  @HiveField(5)
  bool? Lunes;
  @HiveField(6)
  bool? Martes;
  @HiveField(7)
  bool? Miercoles;
  @HiveField(8)
  bool? Jueves;
  @HiveField(9)
  bool? Viernes;
  @HiveField(10)
  bool? Sabado;
  @HiveField(11)
  bool? Domingo;
  @HiveField(12)
  String? Level;
  @HiveField(13)
  String? intensity;
  @HiveField(14)
  String? urlPicture;
}
