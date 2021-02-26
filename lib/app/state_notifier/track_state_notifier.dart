import 'dart:io';

import 'package:circuit_diary/app/domain/repository/geo_repository.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:image_picker/image_picker.dart';

import 'package:circuit_diary/app/state/track_state.dart';

class TrackStateNotifier extends StateNotifier<TrackState> {
  TrackStateNotifier(this._read)
      : super(TrackState(
          editName: "",
          trackName: "",
          postalCode: "",
          address: "",
          latitude: 35.652832,
          longitude: 139.839478,
          image: null,
          url: "",
          memo: "",
        ));

  final T Function<T>() _read;

  GeoRepository get _geoRepository => _read<GeoRepository>();

  final _picker = ImagePicker();

  // 名前入力
  void setTrackName(String value) {
    state = state.copyWith(trackName: value);
  }

  // 郵便番号入力
  Future<void> setPostalCode(String value) async {
    state = state.copyWith(postalCode: value);

    if (value.length == 7) {
      // 住所取得する
      state = state.copyWith(address: "東京都中央区月島");
    }
  }

  // 住所入力
  void setAddress(String value) {
    state = state.copyWith(address: value);
  }

  // 緯度経度から住所取得
  Future<void> reverseGeoCoding(double latitude, double longitude) async {
    var result = await _geoRepository.reverseGeoCoding(latitude, longitude);

    state = state.copyWith(
      address: result,
      latitude: latitude,
      longitude: longitude,
    );
  }

  // ImagePicker起動
  Future<void> pickImage() async {
    final pickedImage = await _picker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      state = state.copyWith(image: File(pickedImage.path));
    }
  }

  // URL入力
  void setUrl(String value) {
    state = state.copyWith(url: value);
  }

  // メモ入力
  void setMemo(String value) {
    state = state.copyWith(memo: value);
  }

  // 初期化
  void clearEdit() {
    state = state.copyWith(
      editName: "",
      trackName: "",
      postalCode: "",
      address: "",
      latitude: 35.652832,
      longitude: 139.839478,
      image: null,
      url: "",
      memo: "",
    );
  }

  Function getEmptyValidator() {
    return (String value) {
      if (value.isEmpty) {
        return "入力してください";
      }

      return null;
    };
  }
}
