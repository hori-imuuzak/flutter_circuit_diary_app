import 'package:hive/hive.dart';

part 'hive_track.g.dart';

@HiveType(typeId: 0)
class HiveTrack extends HiveObject {

  HiveTrack({
    this.name,
    this.postalCode,
    this.address,
    this.latitude,
    this.longitude,
    this.filePath,
    this.url,
    this.note,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  String postalCode;

  @HiveField(2)
  String address;

  @HiveField(3)
  double latitude;

  @HiveField(4)
  double longitude;

  @HiveField(5)
  String filePath;

  @HiveField(6)
  String url;
  
  @HiveField(7)
  String note;
}