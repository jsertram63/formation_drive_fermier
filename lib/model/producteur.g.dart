// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producteur.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProducteurAdapter extends TypeAdapter<Producteur> {
  @override
  final int typeId = 2;

  @override
  Producteur read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Producteur(
      prodtype: fields[0] as Prodtype?,
      geometry: fields[1] as Geometry?,
      id: fields[2] as String?,
      name: fields[3] as String?,
      adresse: fields[4] as String?,
      lieuDeLivraison: fields[5] as String?,
      siteweb: fields[6] as String?,
      telephone: fields[7] as String?,
      description: fields[8] as String?,
      email: fields[9] as String?,
      produitsVendus: fields[10] as String?,
      codePostal: fields[11] as int?,
      departement: fields[12] as int?,
      valide: fields[13] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Producteur obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.prodtype)
      ..writeByte(1)
      ..write(obj.geometry)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.adresse)
      ..writeByte(5)
      ..write(obj.lieuDeLivraison)
      ..writeByte(6)
      ..write(obj.siteweb)
      ..writeByte(7)
      ..write(obj.telephone)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.email)
      ..writeByte(10)
      ..write(obj.produitsVendus)
      ..writeByte(11)
      ..write(obj.codePostal)
      ..writeByte(12)
      ..write(obj.departement)
      ..writeByte(13)
      ..write(obj.valide);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProducteurAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GeometryAdapter extends TypeAdapter<Geometry> {
  @override
  final int typeId = 3;

  @override
  Geometry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Geometry(
      coordinates: fields[0] as Coordinates?,
      type: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Geometry obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.coordinates)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeometryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CoordinatesAdapter extends TypeAdapter<Coordinates> {
  @override
  final int typeId = 4;

  @override
  Coordinates read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Coordinates(
      lat: fields[0] as double,
      lon: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Coordinates obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoordinatesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProdtypeAdapter extends TypeAdapter<Prodtype> {
  @override
  final int typeId = 5;

  @override
  Prodtype read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Prodtype(
      id: fields[0] as int?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Prodtype obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProdtypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
