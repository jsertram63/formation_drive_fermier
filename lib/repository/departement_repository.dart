import 'dart:convert';

import 'package:produits_femier_app/model/boxes.dart';
import 'package:produits_femier_app/model/departement.dart';
import 'package:produits_femier_app/repository/repository.dart';
import 'package:http/http.dart' as http;


/// Repository implementation for [Departement] related data sources.
///
/// Implements [DepartementBaseRepository] to provide methods for retrieving
/// [Departement] data from external sources like APIs and databases.
class DepartementRepository implements DepartementBaseRepository {
  String dataUrl = "http://137.184.217.221/api/v1/departement";


  @override

  /// Retrieves a list of [Departement] objects from the API.
  ///
  /// Sends a GET request to the [dataUrl] to get the list of departements.
  /// Decodes the JSON response into a list of [Departement] objects.
  Future<List<Departement>> getDepartements() async {
    // TODO: implement getDepartements
    var departements = <Departement>[];

    if (boxDepartements.isEmpty){

        print("================");
        print("RECUPERATION DEPARTEMENT");
        print("================");
        final url = Uri.parse(dataUrl);
        final response = await http.get(url);
        final apiReponse = json.decode(response.body) as Map<String, dynamic>;
         final data = apiReponse['departements'];
         for (final json in data) {
            departements.add(Departement.fromJson(json as Map<String, dynamic>));
         }
         departements.forEach((departement) {
          boxDepartements.add(departement);

          });
    }
   
    departements = boxDepartements.values.cast<Departement>().toList();
  
    return departements;
  }


}