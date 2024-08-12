import 'package:produits_femier_app/model/modeleEntreprise.dart';
import 'package:produits_femier_app/model/producteur.dart';
import 'package:produits_femier_app/repository/producteur_repository.dart';

class ProducteursController {
  final ProducteurRepository _repository = ProducteurRepository();

  Future<List<Producteur>> fetchProducteurs(){
    return _repository.getProducts();
  }


  Future InsertProducteur(ModelRequestEntreprise request){
    return _repository.postProducteur(request);
  }


}