// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departement.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DepartementAdapter extends TypeAdapter<Departement> {
  @override
  final int typeId = 1;

  @override
  Departement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Departement(
      id: fields[0] as String?,
      name: fields[1] as String?,
      v: fields[2] as int?,
      numero: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Departement obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.v)
      ..writeByte(3)
      ..write(obj.numero);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DepartementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
