import 'package:flutter/material.dart';
import 'package:produits_femier_app/ui/producteurs/producteur_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:Text("Produits Fermiers",)),
      body: ProducteursPage(),
    );
  }
}