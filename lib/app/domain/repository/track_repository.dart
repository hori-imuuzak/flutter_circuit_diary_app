import 'dart:io';
import 'package:circuit_diary/app/domain/entity/track.dart';

class TrackRepository {
  Future<List<Track>> list() => Future.value([]);
  Future<Track> create(Track track) => Future.value(Track());
  Future<Track> update(String uid, Track track) => Future.value(Track());
  Future<bool> delete(String uid) => Future.value(false);
}