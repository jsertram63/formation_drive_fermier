import 'package:flutter/material.dart';
import 'package:produits_femier_app/model/producteur.dart';
import 'package:produits_femier_app/state/state_widget.dart';
import 'package:produits_femier_app/ui/producteurs/producteur_controller.dart';
import 'package:produits_femier_app/ui/producteurs/producteur_detail_page.dart';

class ProducteursPage extends StatefulWidget {
  const ProducteursPage({super.key});

  @override
  State<ProducteursPage> createState() => _ProducteursPageState();
}

class _ProducteursPageState extends State<ProducteursPage> {


  final _controller = ProducteursController();

  @override
  Widget build(BuildContext context) {


    int typeId = StateInheritedWidget.of(context).type!;
  

    return FutureBuilder(future: _controller.fetchProducteurs(),
     builder: (context, snapShat){



      final producteurs = snapShat.data;
      print(snapShat.error);
      if (producteurs == null){
        return const Center(child: CircularProgressIndicator());
      }

      List<Producteur>? filtersProducteurs;
      if (typeId!=0){
        filtersProducteurs =  snapShat.data!
          .where((producteur) => producteur.prodtype!.id == typeId).toList();
      } else {
        filtersProducteurs = snapShat.data;
      }

      return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: filtersProducteurs!.length,
        itemBuilder: (context, index){
          return _tileProductor(filtersProducteurs![index]);
      });
      


     });
  }


  SizedBox _tileProductor(
      Producteur productor) {
    String dept;
    if (productor.departement! > 9){
      dept = productor.departement.toString();
    }else {
      dept = "0" + productor.departement.toString();
    }
    return SizedBox(
      //padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
        height: 170,
        child: InkWell(
            onTap: () {
              print("on tap");
              print(productor.id);
                  Navigator.of(context).push<MaterialPageRoute>(MaterialPageRoute(
          builder: (context) =>  ProducteurDetailsPage(producteur: productor)));
       
            
            },
        
            child: Container(
              decoration:const BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: Colors.orange,
                          width: 4
                      )
                  )
              ),
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 10,
              // 120
              height: 120,
              child: Column(
                children: <Widget>[
                  Container(
                    //90
                    height: 110,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 10,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                       Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white,
                                    width: 6
                                )
                            ),
                            child: Image.asset("assets/images/campagne.jpg",
                              // 80
                              height: 80,
                              width: 80,
                              fit: BoxFit.fill,
                            ),
        
                          ),
        
                        ),
                        Expanded(
                          flex: 7,
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
        
                              children: <Widget>[
                                Expanded(
                                    flex: 7,
                                    child: Container(
                                      // Title of producteur
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 14,
                                              child: Text(
                                              productor.name!,
                                                style: const TextStyle(
                                                    color: Colors
                                                        .lightGreen,
                                                    height: 1.2,
                                                    fontWeight: FontWeight
                                                        .bold
                                                ),
                                              ),
        
                                            ),
                                            Expanded(
                                                flex: 2,
                                                child: Row(
                                                  children: [
                    
                                                    Padding(
                                                      padding: const EdgeInsets.only(top:13.0),
                                                      child: Container(
                                                          decoration: BoxDecoration(
                                                              border: Border
                                                                  .all(
                                                                color: Colors
                                                                    .orange,
        
                                                              ),
                                                              borderRadius: const BorderRadius
                                                                  .all(Radius
                                                                  .circular(
                                                                  20))
                                                          ),
                                                          child: SizedBox(
                                                            height: 25,
                                                            width: 25,
                                                            child: Padding(
                                                              padding: const EdgeInsets.only(top:3.0),
                                                              child: Text(
                                                                dept,
                                                              )
                                                            ),
                                                          )
                                                      ),
                                                    )
                                                  ],
                                                )
                                            ),
                                          ],
                                        )
                                    )),
                                Expanded(
                                    flex: 12,
                                    child: Container(
        
                                      child: Row(
                                        children: <Widget>[
        
                                          Expanded(
                                              flex: 8,
                                              child: Container(
                                                alignment: Alignment
                                                    .topLeft,
                                                child: Text(
                                                  productor.produitsVendus!,
                                                  style: const TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      color: Colors.grey
                                                  ),),
                                              )),
                                          Expanded(
                                              flex: 4,
                                              child: Container(
        
                                                child: Column(
                                                  children: <Widget>[
                                                    Expanded(
                                                        flex: 5,
                                                        child: Container(
                                                      /*    height: 40,
                                                          width: 40,
                                                          child: Image
                                                              .asset(
                                                            "assets/location.png",
                                                            color: Colors
                                                                .orange,),*/
                                                        )
                                                    ),
                                                    Expanded(
                                                        flex: 3,
                                                        child: Padding(
                                                          padding: EdgeInsets.only(left:1.0),
                                                          child: Container(
                                                            child: Text("à x kms",
                                                          style:TextStyle(                          
                                                          fontStyle: FontStyle.normal,
                                                            
                                                              fontWeight: FontWeight.w900,
                                                            ),
                                                          ),
                                                        )
                                                         ) )
                                                  ],
                                                ),
        
                                              )),
                                        ],
                                      ),
                                    )),
        
        
                              ],
                            ),
                          ),
        
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 10,
                    color: Colors.grey[300],
        
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                      child: Text(productor.description!,
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),),
                    ),
                  )
                ],
              ),
            )
        
        ));
      }

    


  


}