import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:produits_femier_app/model/modeleEntreprise.dart';
import 'package:produits_femier_app/ui/producteurs/producteur_controller.dart';

class Formulaire extends StatefulWidget {
  const Formulaire({super.key});

  @override
  State<Formulaire> createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {


  ModelRequestEntreprise request = new ModelRequestEntreprise();
  final _controller = ProducteursController();

   final _formKey = GlobalKey<FormState>();
  List<String> entete = ['Selectionnez le produit type'];
  late List<String> typeProduitsChoix;
  List<String> typeProduits = ['Viandes-Charcuterie','Fromages','Fruits et légumes','Vollaile-oeufs-Lapins',"Miel","Epices","Fruits de mer-Poissons","Vins-Boissons","Pains-Boulangerie","Plantes","Champignons-Escargots","Autres"];
  String? _value; // le champ selectionné dans la dropdownButton
    


@override
  Widget build(BuildContext context) {
    typeProduitsChoix = entete + typeProduits;

    //  typeProduitsChoix = entete + typeProduits;

    final halfMediaWidth = MediaQuery
        .of(context)
        .size
        .width / 2.0;
    typeProduitsChoix = entete + typeProduits;
   return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:TextField(
            decoration: InputDecoration(
              labelText:"Entrez nom de votre structure",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
            onChanged: (value){

              request.name = value;
              
              setState(() {
                
              });
        
            },
          )), 
        
    
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:TextField(
            decoration: InputDecoration(
              labelText:"Entrez adrese",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
            onChanged: (value){
              request.adresse = value;

              
              setState(() {
                
              });
        
            },

          )), Padding(
          padding: const EdgeInsets.all(8.0),
          child:TextField(
            decoration: InputDecoration(
              labelText:"Entrez description",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
            onChanged: (value){

              request.description = value;
              setState(() {
                
              });
        
            },
          )),
          Padding(
          padding: const EdgeInsets.all(8.0),
          child:TextField(
            decoration: InputDecoration(
              labelText:"Lieu de Livraison",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
            onChanged: (value){

              request.lieuDeLivraison = value;
              setState(() {
                
              });
        
            },
          )),
           Padding(
          padding: const EdgeInsets.all(8.0),
          child:TextField(
            decoration: InputDecoration(
              labelText:"Produits vendus",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
            onChanged: (value){

              request.produitsVendus = value;
              setState(() {
                
              });
        
            },
          )),
          Container(
            alignment: Alignment.topCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: TextField(
                     decoration: InputDecoration(
                     labelText:"Ville",
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                 ),
                  
                    onChanged: (String value) {
                    
                    },
                  ),
                ),Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: TextField(
                     decoration: InputDecoration(
                       labelText:"code Postal",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
                  
                    onChanged: (String value) {
                      request.departement = int.tryParse(value);
                        print(request.departement);
                        request.codePostal = value;
                        print(request.toString());
                      
                        print("CODE POSTAL ${value.length}");
                        if (value.length == 5) {
                        String firstChar = value.substring(0,1);
                        print("FIRST CHAR ${firstChar}");
                        print("Le code postal a 5 chiffres");
                        if (firstChar == '0') {
                          print("=>1");
                          request.departement =
                              int.tryParse(value.substring(1, 2));
                          print(request.departement);
                          print("=>2");
                        } else {
                          request.departement =
                              int.tryParse(value.substring(0, 2));
                          print("=>3");
                          print(request.departement);
                        }
                        }
                    },
                  ),
                  )])), 

            
          
          DropdownButton<String>(
            items: typeProduitsChoix.map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (value){
            setState(() {
                request.prodtype = value;
              request.idProdtype = setIdProdtype(request.prodtype!);
              print(request.prodtype);
            });
            },
            value: _value,
            hint: Text("Selectionnez le type de produits"),
            
          ),
           Padding(
          padding: const EdgeInsets.all(8.0),
          child:TextField(
            decoration: InputDecoration(
              labelText:"Email",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
            onChanged: (value){

              request.mail = value;

              setState(() {
                
                
              });
        
            },
          )),
           Padding(
          padding: const EdgeInsets.all(8.0),
          child:TextField(
            decoration: InputDecoration(
              labelText:"Telephone",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
            onChanged: (value){
              request.tel = value;
              setState(() {
                
              });
        
            },
          )),
           Padding(
          padding: const EdgeInsets.all(8.0),
          child:TextField(
            decoration: InputDecoration(
              labelText:"site Web",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
            onChanged: (value){

              request.siteWeb = value;

              setState(() {
                
              });
        
            },
          )),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: BoutonValidationFomulaire()
            
            /*
            TextButton(onPressed: (){
              // coordonnées gps lat - lon
              final query = request.adresse! + " " + request.codePostal!;
              request.valide = false;
      
              locationFromAddress(query).then((location) {
                var output = location[0].toString();
                request.lat = location[0].latitude;
                request.lon = location[0].longitude;
                print(request.toString());
                _controller.InsertProducteur(request);


                // ENVOI de la requete : controller 
                // Navigation popup
              });

              request.idProdtype = 2;




            
            }, child: Text("Valider",style: TextStyle(fontSize: 30),)),*/
          )
    
       
      
    
    
      ]));
          
  }

  int? setIdProdtype(String nameProd) {
    switch (nameProd) {
      case 'Viandes-Charcuterie':
        {
          return 2;
        }
      case 'Fruits et légumes':
        {
          return 4;
        }
      case 'Fromages':
        {
          return 3;
        }
      case 'Vollaile-oeufs-Lapins':
        {
          return 1;
        }
      case 'Miel':
        {
          return 5;
        }
      case 'Vins-Boissons':
        {
          return 6;
        }
      case 'Epices':
        {
          return 7;
        }
      case 'Fruits de mer':
        {
          return 8;
        }
      case 'Pains-Boulangerie':
        {
          return 9;
        }
      case 'Plantes':
        {
          return 10;
        }
      case 'Champignons-Escargots':
        {
          return 11;
        }
      case 'Autres':
        {
          return 12;
        }
    }
  }



}

class BoutonValidationFomulaire extends StatefulWidget {
 
    ModelRequestEntreprise? request;
  BoutonValidationFomulaire({Key? key, this.request});


  @override
  State<BoutonValidationFomulaire> createState() => _BoutonValidationFomulaireState();
}

class _BoutonValidationFomulaireState extends State<BoutonValidationFomulaire> {

  bool _isLoading = false;
  final _controller = ProducteursController();



  void _executeAction() async {

    var request = widget.request;
    var codePostal = request?.codePostal;
    
      String query = request?.adresse??"" + " " + codePostal!;
              request?.valide = false;
      
              locationFromAddress(query).then((location) {
                var output = location[0].toString();
                request?.lat = location[0].latitude;
                request?.lon = location[0].longitude;
                print(request.toString());
                _controller.InsertProducteur(request!);


                // ENVOI de la requete : controller 
                // Navigation popup
              });


    

    setState(() {
      _isLoading = true;
    });
    try {
      _showSnackBar("Insertion d'un producteur");

    }catch(e){
      _showSnackBar("Erreur lors de l'exécution de l'insertion");
    } finally{
      setState(() {
        _isLoading = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if(_isLoading) CircularProgressIndicator(),
      if(!_isLoading)
        TextButton(onPressed: (){
          
        }, child: Text("Valider",style: TextStyle(fontSize: 30),))

    ],);
  }

  void _showSnackBar(String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),backgroundColor: Colors.green,));
  }
}