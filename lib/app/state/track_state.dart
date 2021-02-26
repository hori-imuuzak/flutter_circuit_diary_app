import 'dart:io';

class TrackState {
  TrackState({
    this.trackName,
    this.postalCode,
    this.address,
    this.latitude,
    this.longitude,
    this.image,
    this.url,
    this.memo,
  });

  final String trackName;
  final String postalCode;
  final String address;
  final double latitude;
  final double longitude;
  final File image;
  final String url;
  final String memo;
}