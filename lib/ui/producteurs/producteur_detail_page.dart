import 'package:flutter/material.dart';
import 'package:produits_femier_app/model/producteur.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:produits_femier_app/state/state_widget.dart';


class ProducteurDetailsPage extends StatelessWidget {

  final Producteur producteur;
  const ProducteurDetailsPage({super.key, required this.producteur});
  @override
  Widget build(BuildContext context) {
    int type = StateInheritedWidget.of(context).type!;
    // construction du marker pour le producteur selectionné
    Marker marker = Marker(point:LatLng(producteur.geometry!.coordinates!.lat, producteur.geometry!.coordinates!.lon), 
     child: const Icon(
      Icons.location_on,
      color: Colors.red,
      size: 35,
     ));
    return Scaffold(
      appBar: AppBar(title: Text(producteur.name??"")),
      body: Column(children: 
         [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 250,
          child:  FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(producteur.geometry!.coordinates!.lat, producteur.geometry!.coordinates!.lon),
              initialZoom: 15.2
            ),
            children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                ),
                MarkerClusterLayerWidget(options:
                MarkerClusterLayerOptions(
    
                  maxClusterRadius: 45,
                  size: const Size(40,40),
                  markers: [marker],
                  builder: (context, markers) {
                      return Container(
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue),
                      child: Center(
                      child: Text(
                      markers.length.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );   
                  }
                 )
                        
                
                )
                
            ]),

        ),
        Text(" Type Selectionné ${type}")



      ]),


    );

  }
}