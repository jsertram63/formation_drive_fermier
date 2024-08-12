

import 'package:hive/hive.dart';

part 'departement.g.dart';

@HiveType(typeId: 1)
class Departement {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
    @HiveField(2)
  final int? v;
    @HiveField(3)
  final int? numero;

  Departement({required this.id, required this.name, required this.v, required this.numero});
  factory Departement.fromJson(Map<String, dynamic> json){
    return Departement(id: json["id"], 
    name: json["name"], v:json["__v"], numero:json["numero"]);
  }


}