import 'dart:io';

import 'package:circuit_diary/app/domain/entity/track.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_state.freezed.dart';

@freezed
abstract class TrackState with _$TrackState {

  factory TrackState({
    List<Track> trackList,
    String editName,
    String trackName,
    String postalCode,
    String address,
    double latitude,
    double longitude,
    File image,
    String url,
    String note,
    bool isUpdate,
    bool isSaved,
  }) = _TrackState;
}