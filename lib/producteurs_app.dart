import 'package:flutter/material.dart';
import 'package:produits_femier_app/strings.dart';
import 'package:produits_femier_app/ui/drawer_app.dart';
import 'package:produits_femier_app/ui/producteurs/producteur_page.dart';

class ProducteursApp extends StatelessWidget {
  const ProducteursApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.appTitle)),
      drawer: MyDrawer(),
      body: const ProducteursPage(),
    );
  }
}