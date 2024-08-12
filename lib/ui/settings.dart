import 'package:flutter/material.dart';
import 'package:produits_femier_app/model/boxes.dart';
import 'package:produits_femier_app/state/state_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}
class _SettingsPageState extends State<SettingsPage> {
  @override
  List<String> entete = ['Selectionnez'];
  late List<String> typeProduitsChoix;
  List<String> typeProduits = [
    'Vollaile-oeufs-Lapins',
    'Viandes-Charcuterie',
    'Fromages',
     'Fruits et légumes',
     "Miel",
      "Vins-Boissons",
      "Epices",
     "Fruits de mer-Poissons",
    "Pains-Boulangerie",
    "Champignons-Escargots",
    "Autres",
    "Plantes" 
  ];

    String? _value;

  @override
  Widget build(BuildContext context) {
     typeProduitsChoix = entete + typeProduits;

     //StateInheritedWidget.of(context).updateTaille();
    return Scaffold(
      appBar: AppBar(title: Text("Filtre"),),
      body:     Column(
        children: [
          DropdownButton<String>(
            items: typeProduitsChoix.map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _value = value;
                int _selectedIndex = typeProduitsChoix.indexOf(value!); 
                StateInheritedWidget.of(context).type = _selectedIndex;
             
              });
            },
            hint: Text("Selectionnez le produit type"),
            value: _value,
          ),
            SizedBox(
        height: 40,
      
      ),
        
        ElevatedButton(onPressed: (){
          boxDepartements.clear();
          boxProducteurs.clear();

        }, child: Text("Reset "))
       
        ],
      ),
    

      
    );
  }
}