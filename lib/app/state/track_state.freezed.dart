// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'track_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TrackStateTearOff {
  const _$TrackStateTearOff();

// ignore: unused_element
  _TrackState call(
      {String editName,
      String trackName,
      String postalCode,
      String address,
      double latitude,
      double longitude,
      File image,
      String url,
      String memo}) {
    return _TrackState(
      editName: editName,
      trackName: trackName,
      postalCode: postalCode,
      address: address,
      latitude: latitude,
      longitude: longitude,
      image: image,
      url: url,
      memo: memo,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TrackState = _$TrackStateTearOff();

/// @nodoc
mixin _$TrackState {
  String get editName;
  String get trackName;
  String get postalCode;
  String get address;
  double get latitude;
  double get longitude;
  File get image;
  String get url;
  String get memo;

  @JsonKey(ignore: true)
  $TrackStateCopyWith<TrackState> get copyWith;
}

/// @nodoc
abstract class $TrackStateCopyWith<$Res> {
  factory $TrackStateCopyWith(
          TrackState value, $Res Function(TrackState) then) =
      _$TrackStateCopyWithImpl<$Res>;
  $Res call(
      {String editName,
      String trackName,
      String postalCode,
      String address,
      double latitude,
      double longitude,
      File image,
      String url,
      String memo});
}

/// @nodoc
class _$TrackStateCopyWithImpl<$Res> implements $TrackStateCopyWith<$Res> {
  _$TrackStateCopyWithImpl(this._value, this._then);

  final TrackState _value;
  // ignore: unused_field
  final $Res Function(TrackState) _then;

  @override
  $Res call({
    Object editName = freezed,
    Object trackName = freezed,
    Object postalCode = freezed,
    Object address = freezed,
    Object latitude = freezed,
    Object longitude = freezed,
    Object image = freezed,
    Object url = freezed,
    Object memo = freezed,
  }) {
    return _then(_value.copyWith(
      editName: editName == freezed ? _value.editName : editName as String,
      trackName: trackName == freezed ? _value.trackName : trackName as String,
      postalCode:
          postalCode == freezed ? _value.postalCode : postalCode as String,
      address: address == freezed ? _value.address : address as String,
      latitude: latitude == freezed ? _value.latitude : latitude as double,
      longitude: longitude == freezed ? _value.longitude : longitude as double,
      image: image == freezed ? _value.image : image as File,
      url: url == freezed ? _value.url : url as String,
      memo: memo == freezed ? _value.memo : memo as String,
    ));
  }
}

/// @nodoc
abstract class _$TrackStateCopyWith<$Res> implements $TrackStateCopyWith<$Res> {
  factory _$TrackStateCopyWith(
          _TrackState value, $Res Function(_TrackState) then) =
      __$TrackStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String editName,
      String trackName,
      String postalCode,
      String address,
      double latitude,
      double longitude,
      File image,
      String url,
      String memo});
}

/// @nodoc
class __$TrackStateCopyWithImpl<$Res> extends _$TrackStateCopyWithImpl<$Res>
    implements _$TrackStateCopyWith<$Res> {
  __$TrackStateCopyWithImpl(
      _TrackState _value, $Res Function(_TrackState) _then)
      : super(_value, (v) => _then(v as _TrackState));

  @override
  _TrackState get _value => super._value as _TrackState;

  @override
  $Res call({
    Object editName = freezed,
    Object trackName = freezed,
    Object postalCode = freezed,
    Object address = freezed,
    Object latitude = freezed,
    Object longitude = freezed,
    Object image = freezed,
    Object url = freezed,
    Object memo = freezed,
  }) {
    return _then(_TrackState(
      editName: editName == freezed ? _value.editName : editName as String,
      trackName: trackName == freezed ? _value.trackName : trackName as String,
      postalCode:
          postalCode == freezed ? _value.postalCode : postalCode as String,
      address: address == freezed ? _value.address : address as String,
      latitude: latitude == freezed ? _value.latitude : latitude as double,
      longitude: longitude == freezed ? _value.longitude : longitude as double,
      image: image == freezed ? _value.image : image as File,
      url: url == freezed ? _value.url : url as String,
      memo: memo == freezed ? _value.memo : memo as String,
    ));
  }
}

/// @nodoc
class _$_TrackState implements _TrackState {
  _$_TrackState(
      {this.editName,
      this.trackName,
      this.postalCode,
      this.address,
      this.latitude,
      this.longitude,
      this.image,
      this.url,
      this.memo});

  @override
  final String editName;
  @override
  final String trackName;
  @override
  final String postalCode;
  @override
  final String address;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final File image;
  @override
  final String url;
  @override
  final String memo;

  @override
  String toString() {
    return 'TrackState(editName: $editName, trackName: $trackName, postalCode: $postalCode, address: $address, latitude: $latitude, longitude: $longitude, image: $image, url: $url, memo: $memo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TrackState &&
            (identical(other.editName, editName) ||
                const DeepCollectionEquality()
                    .equals(other.editName, editName)) &&
            (identical(other.trackName, trackName) ||
                const DeepCollectionEquality()
                    .equals(other.trackName, trackName)) &&
            (identical(other.postalCode, postalCode) ||
                const DeepCollectionEquality()
                    .equals(other.postalCode, postalCode)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.memo, memo) ||
                const DeepCollectionEquality().equals(other.memo, memo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(editName) ^
      const DeepCollectionEquality().hash(trackName) ^
      const DeepCollectionEquality().hash(postalCode) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(memo);

  @JsonKey(ignore: true)
  @override
  _$TrackStateCopyWith<_TrackState> get copyWith =>
      __$TrackStateCopyWithImpl<_TrackState>(this, _$identity);
}

abstract class _TrackState implements TrackState {
  factory _TrackState(
      {String editName,
      String trackName,
      String postalCode,
      String address,
      double latitude,
      double longitude,
      File image,
      String url,
      String memo}) = _$_TrackState;

  @override
  String get editName;
  @override
  String get trackName;
  @override
  String get postalCode;
  @override
  String get address;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  File get image;
  @override
  String get url;
  @override
  String get memo;
  @override
  @JsonKey(ignore: true)
  _$TrackStateCopyWith<_TrackState> get copyWith;
}
