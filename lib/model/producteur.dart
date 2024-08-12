import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
part 'producteur.g.dart';

@HiveType(typeId: 2)
class Producteur {
    @HiveField(0)
    Prodtype? prodtype;
    @HiveField(1)
    Geometry? geometry;
    //List<dynamic> reviews;
    @HiveField(2)
    String? id;
    @HiveField(3)
    String? name;
    @HiveField(4)
    String? adresse;
    @HiveField(5)
    String? lieuDeLivraison;
    @HiveField(6)
    String? siteweb;
    @HiveField(7)
    String? telephone;
    @HiveField(8)
    String? description;
    @HiveField(9)
    String? email;
    @HiveField(10)
    String? produitsVendus;
    @HiveField(11)
    
    int? codePostal;
    @HiveField(12)
    int? departement;
    @HiveField(13)
    bool? valide;

    Producteur({
        required this.prodtype,
        required this.geometry,
        //required this.reviews,
        required this.id,
        required this.name,
        required this.adresse,
        required this.lieuDeLivraison,
        required this.siteweb,
        required this.telephone,
        required this.description,
        required this.email,
        required this.produitsVendus,
        required this.codePostal,
        required this.departement,
        required this.valide,
    });


  factory Producteur.fromJson(Map<String, dynamic> json){ 
        return Producteur(
            prodtype: json["prodtype"] == null ? null : Prodtype.fromJson(json["prodtype"]),
            geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
            //reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
            id: json["_id"],
            name: json["name"],
            adresse: json["adresse"],
            lieuDeLivraison: json["lieuDeLivraison"],
            siteweb: json["siteweb"],
            telephone: json["telephone"],
            description: json["description"],
            email: json["email"],
            produitsVendus: json["produitsVendus"],
            codePostal: json["codePostal"],
            departement: json["departement"],
            valide: json["valide"],
        );
    }
    
  @override
  String toString() {
    // TODO: implement toString
    return name ?? "name";
  }



}
@HiveType(typeId: 3)
class Geometry {
    Geometry({
        required this.coordinates,
        required this.type,
    });
    @HiveField(0)
    final Coordinates? coordinates;
    @HiveField(1)
    final String? type;

    factory Geometry.fromJson(Map<String, dynamic> json){ 
        return Geometry(
            coordinates: json["coordinates"] == null ? null : Coordinates.fromJson(json["coordinates"]),
            type: json["type"],
        );
    }

}
@HiveType(typeId: 4)
class Coordinates {
    @HiveField(0)
    double lat;
    @HiveField(1)
    double lon;

    Coordinates({
        required this.lat,
        required this.lon,
    });

    factory Coordinates.fromJson(Map<String, dynamic> json){ 
        return Coordinates(
            lat: json["lat"],
            lon: json["lon"],
        );
    }

}
@HiveType(typeId: 5)
class Prodtype {
    Prodtype({
        required this.id,
        required this.name,
    });
    @HiveField(0)
    final int? id;
    @HiveField(1)
    final String? name;

    factory Prodtype.fromJson(Map<String, dynamic> json){ 
        return Prodtype(
            id: json["id"],
            name: json["name"],
        );
    }

}
