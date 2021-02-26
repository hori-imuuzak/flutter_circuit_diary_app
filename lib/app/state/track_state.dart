import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_state.freezed.dart';

@freezed
abstract class TrackState with _$TrackState {

  factory TrackState({
    String editName,
    String trackName,
    String postalCode,
    String address,
    double latitude,
    double longitude,
    File image,
    String url,
    String memo,
  }) = _TrackState;
}