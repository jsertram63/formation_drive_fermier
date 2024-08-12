class ModelRequestEntreprise {
  String? name;
  String? lieuDeLivraison;
  int? departement;
  String? siteWeb;
  String? tel;
  String? mail;
  String? type;
  double? lat;
  double? lon;
  String? prodtype;
  String? codePostal;
  int? idProdtype;
  String? adresse;
  String? produitsVendus;
  String? description;
  bool? valide;



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    final Map<String, dynamic> coord = new Map<String, dynamic>();
    final Map<String, dynamic> coordonates = new Map<String, dynamic>();
    data['name'] = this.name;
    data['lieuDeLivraison'] = this.lieuDeLivraison;
    data['prodtype']= this.type;
    data['valide'] = this.valide;
    coord['coordinates'] = {
      'lat' : this.lat,
      'lon':this.lon
    };

    coordonates['coordonates'] = coord;
    data['geometry'] = coordonates['coordonates'];
    data['codePostal'] = this.codePostal;

    data['description'] = this.description;
    data['produitsVendus'] = this.produitsVendus;
    data['departement'] = this.departement;
    data['prodtype'] = {
      'id':this.idProdtype??"1",
      'name':this.prodtype
    };
    print(data['prodtype']);
    data['adresse'] = this.adresse;
    data['siteweb'] = this.siteWeb;
    data['telephone'] = this.tel;
    data['email'] = this.mail;
    data['produitsVendus'] = this.produitsVendus;
    print(data);
    return data;
  }

  String toString() {
    return 'ModelRequestEntreprise{name: $name, lieuDeLivraison: $lieuDeLivraison, departement: $departement, siteWeb: $siteWeb, tel: $tel, mail: $mail, type: $type, lat: $lat, lon: $lon, prodtype: $prodtype, codePostal: $codePostal, idProdtype: $idProdtype, adresse: $adresse, produitsVendus: $produitsVendus, description: $description, valide: $valide}';
  }



}