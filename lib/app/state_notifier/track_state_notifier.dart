import 'package:circuit_diary/app/domain/repository/geo_repository.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:circuit_diary/app/state/track_state.dart';

class TrackStateNotifier extends StateNotifier<TrackState> {

  TrackStateNotifier(this._read): super(
    TrackState(
      trackName: "",
      postalCode: "",
      address: "",
      latitude: 35.652832,
      longitude: 139.839478,
      image: null,
      url: "",
      memo: ""
    )
  );

  final T Function<T>() _read;

  GeoRepository get _geoRepository => _read<GeoRepository>();

  // 名前入力
  void setTrackName(String value) {
    state = TrackState(
      trackName: value,
      postalCode: state.postalCode,
      address: state.address,
      latitude: state.latitude,
      longitude: state.longitude,
      image: state.image,
      url: state.url,
      memo: state.memo,
    );
  }

  // 緯度経度から住所取得
  Future<void> reverseGeoCoding(double latitude, double longitude) async {
    var result = await _geoRepository.reverseGeoCoding(latitude, longitude);

    state = TrackState(
      trackName: state.trackName,
      postalCode: state.postalCode,
      address: result,
      latitude: state.latitude,
      longitude: state.longitude,
      image: state.image,
      url: state.url,
      memo: state.memo,
    );
  }
}