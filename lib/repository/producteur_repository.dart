
import 'dart:convert';

import 'dart:math';

import 'package:produits_femier_app/model/boxes.dart';
import 'package:produits_femier_app/model/modeleEntreprise.dart';
import 'package:produits_femier_app/model/producteur.dart';
import 'package:produits_femier_app/repository/repository.dart';
import 'package:http/http.dart' as http;

class ProducteurRepository implements ProducteurBaseRepository{
  String dataUrl = "http://137.184.217.221/api/v1/producteur/";

  @override
  Future<List<Producteur>> getProducts() async {
    var  producteurs = <Producteur> [];
    var url = dataUrl;
    // TODO: implement getProducts
    if (boxProducteurs.isEmpty){
       final uri = Uri.parse(url);
      final response = await http.get(uri);
      final apiResponse = json.decode(response.body) as Map<String, dynamic>;
      final data = apiResponse['producteurs'];
      // print(apiResponse);
       if(response.statusCode == 200){
         for (final json in data){
        producteurs.add(Producteur.fromJson(json as Map<String,dynamic>));
        producteurs.forEach((producteur) {

          boxProducteurs.add(Producteur.fromJson(json as Map<String,dynamic>));

         });
    }

   }
   // tri des 
    var latPoint = 46.131859;
    var lonPoint = 3.425488;
    sortLocationsByProximity(producteurs,LocationPoint(latPoint, lonPoint));
   
    print(producteurs);



    }

    producteurs = boxProducteurs.values.cast<Producteur>().toList();
   
 
    return producteurs;

  }
    double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
      var p = 0.017453292519943295; 
      var c = cos;
      var a = 0.5 - c((lat2 - lat1) * p)/2 + 
          c(lat1 * p) * c(lat2 * p) * 
          (1 - c((lon2 - lon1) * p))/2;
        return 12742 * asin(sqrt(a)); 
    }

       void sortLocationsByProximity(List<Producteur> locations, LocationPoint currentLocation) {
        locations.sort((a, b) {

    var  aLat = a.geometry!.coordinates?.lat!;
    var  aLon = a.geometry!.coordinates?.lon!;
    var  bLat = b.geometry!.coordinates?.lat!;
    var  bLon = b.geometry!.coordinates?.lon!;
    var distA = calculateDistance(currentLocation.latitude, currentLocation.longitude, aLat!, aLon!);
    var distB = calculateDistance(currentLocation.latitude, currentLocation.longitude, bLat!, bLon!);
    return distA.compareTo(distB);
  });





}

  @override
  Future postProducteur(ModelRequestEntreprise request) async{
    // TODO: implement postProducteur
    var dataUrl = "http://137.184.217.221/api/v1/producteur/add";
    Map<String,dynamic> data = request.toJson();
    print("======================");
    print("=> POST");
    print(data);
    print("=======================");

    final url = Uri.parse(dataUrl);

     final headers = {
      "content-type":"application/json",
      "Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVmNjg5NDg4Y2U1YjQxNWEwOWUzNWNiMSIsImlhdCI6MTcwNDMwODg0MSwiZXhwIjoxNzA2OTAwODQxfQ.I0jLXuy0rFFq63k7g5OtBma51Q4nM0wr6sbCYo8AdBY"};
    final response = await http.post(url,body: json.encode(data),headers: headers);

    if(response.statusCode == 200 ||response.statusCode == 201){
      print("La requete a bien été prise en compte par le serveur");
    }
   
  }


}
class LocationPoint {
  double latitude;
  double longitude;

  LocationPoint(this.latitude, this.longitude);
}