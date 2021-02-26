// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_track.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveTrackAdapter extends TypeAdapter<HiveTrack> {
  @override
  final int typeId = 0;

  @override
  HiveTrack read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveTrack(
      name: fields[0] as String,
      postalCode: fields[1] as String,
      address: fields[2] as String,
      latitude: fields[3] as double,
      longitude: fields[4] as double,
      filePath: fields[5] as String,
      url: fields[6] as String,
      note: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveTrack obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.postalCode)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.latitude)
      ..writeByte(4)
      ..write(obj.longitude)
      ..writeByte(5)
      ..write(obj.filePath)
      ..writeByte(6)
      ..write(obj.url)
      ..writeByte(7)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveTrackAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
