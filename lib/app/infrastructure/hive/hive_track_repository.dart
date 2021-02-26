import 'package:circuit_diary/app/domain/entity/track.dart';
import 'package:circuit_diary/app/domain/repository/track_repository.dart';
import 'package:circuit_diary/app/infrastructure/hive/entity/hive_track.dart';
import 'package:hive/hive.dart';

class HiveTrackRepository implements TrackRepository {
  final box = Hive.box<HiveTrack>("tracks");

  Future<List<Track>> list() async {
    List<Track> tracks = [];
    if (box.isNotEmpty) {
      box.values.forEach((item) {
        tracks.add(Track(
          name: item.name,
          postalCode: item.postalCode,
          address: item.address,
          latitude: item.latitude,
          longitude: item.longitude,
          imageUrl: item.filePath,
          url: item.url,
          note: item.note,
        ));
      });
    }

    return Future.value(tracks);
  }

  Future<Track> create(Track track) async {
    var item = HiveTrack(
      name: track.name,
      postalCode: track.postalCode,
      address: track.address,
      latitude: track.latitude,
      longitude: track.longitude,
      filePath: track.imageUrl,
      url: track.url,
      note: track.note,
    );
    await box.add(item);

    return Future.value(track);
  }

  Future<Track> update(String uid, Track track) {
    return Future.value(Track());
  }

  Future<bool> delete(String uid) {
    return Future.value(true);
  }
}