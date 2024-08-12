import 'package:produits_femier_app/model/departement.dart';
import 'package:produits_femier_app/repository/departement_repository.dart';

class DepartementController {
  final DepartementRepository _repository = DepartementRepository();

  Future<List<Departement>> fetchDepartements(){
    return _repository.getDepartements();
  }

}