import 'package:flutter/material.dart';
import 'package:produits_femier_app/ui/departement/departement_controller.dart';

class DepartementPage extends StatelessWidget {
  DepartementPage({super.key});


  final _controller = DepartementController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Departements")),
      body: FutureBuilder(future: _controller.fetchDepartements(),
       builder: (context, snapShot){
          var departements = snapShot.data;
          // tri des departements par ordre croissants
           departements?.sort((a, b) {
              // Si les deux numéros sont non nuls, comparez-les normalement
              if (a.numero != null && b.numero != null) {
                return a.numero!.compareTo(b.numero!);
              }
              // Si l'un des numéros est nul, traitez-le comme inférieur
              if (a.numero == null) {
                return -1; // a est inférieur si son numéro est nul
              }
              return 1; // b est inférieur si son numéro est nul
            });
          if (departements == null){
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: departements.length,
            itemBuilder:(context, index){
              return ListTile(
                title: Text(departements[index].name! ??""),
              );
            },

          );

       })

    );
  }
}