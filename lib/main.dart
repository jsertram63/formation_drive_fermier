import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:produits_femier_app/model/boxes.dart';
import 'package:produits_femier_app/model/departement.dart';
import 'package:produits_femier_app/model/producteur.dart';
import 'package:produits_femier_app/producteurs_app.dart';
import 'package:produits_femier_app/state/state_widget.dart';
import 'package:produits_femier_app/strings.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationCacheDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(DepartementAdapter());
  Hive.registerAdapter(ProducteurAdapter());
  Hive.registerAdapter(CoordinatesAdapter());
  Hive.registerAdapter(GeometryAdapter());
  Hive.registerAdapter(ProdtypeAdapter());
  boxDepartements = await Hive.openBox<Departement>('DepartementBox');
  boxProducteurs = await Hive.openBox<Producteur>('ProducteursBox');

  return  runApp(FilterWidget(
  type: 0,
  child: MaterialApp(
    debugShowCheckedModeBanner: false,
    title: Strings.appTitle,
    theme: ThemeData(primaryColor:Colors.green.shade800),
    home: const ProducteursApp(),
  
  ),
));
}


