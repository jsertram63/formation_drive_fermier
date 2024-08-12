import 'package:produits_femier_app/model/departement.dart';
import 'package:produits_femier_app/model/modeleEntreprise.dart';
import 'package:produits_femier_app/model/producteur.dart';

abstract class ProducteurBaseRepository {
  Future<List<Producteur>> getProducts();
  Future postProducteur(ModelRequestEntreprise request);

}

abstract class DepartementBaseRepository{
  Future<List<Departement>> getDepartements();
  
}