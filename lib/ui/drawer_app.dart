import 'package:flutter/material.dart';
import 'package:produits_femier_app/ui/departement/departement_page.dart';
import 'package:produits_femier_app/ui/home/home_page.dart';
import 'package:produits_femier_app/ui/inscription/inscription_page.dart';
import 'package:produits_femier_app/ui/settings.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
 Widget build(BuildContext context) {
    return Drawer(child: ListView(
      children: [
        DrawerHeader(child:
         Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:Container(
                    height: 75,
                    width: 75,
                    child:const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/campagne.jpg'),
                    ),
                  ),
          ),),
          // empilement de tile pour les rubriques 
             ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>const HomePage()));

          },
          title: Text("Les producteurs")),
            ListTile(
          onTap: (){
            

              Navigator.push(context, MaterialPageRoute(builder: (context) => DepartementPage()));
    
          },
          title: Text("Les départements")),
        
           ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>SettingsPage()));

          },
          title: Text("settings")),
          
        

      ],

      
    ),

    );
  }

}