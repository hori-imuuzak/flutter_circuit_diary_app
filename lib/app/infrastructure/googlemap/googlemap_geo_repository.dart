import 'package:circuit_diary/app/domain/repository/geo_repository.dart';

class GoogleMapGeoRepository implements GeoRepository {

  @override
  Future<String> reverseGeoCoding(double latitude, double longitude) {
    return Future.value("神奈川県藤沢市ほげほげ");
  }
}