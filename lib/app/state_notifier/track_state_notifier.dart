import 'package:circuit_diary/app/domain/repository/geo_repository.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:circuit_diary/app/state/track_state.dart';

class TrackStateNotifier extends StateNotifier<TrackState> {

  TrackStateNotifier(this._read): super(
    TrackState()
  );

  final T Function<T>() _read;

  GeoRepository get _geoRepository => _read<GeoRepository>();

  // 緯度経度から住所取得
  Future<void> reverseGeoCoding(double latitude, double longitude) async {
    var result = await _geoRepository.reverseGeoCoding(latitude, longitude);

    state = TrackState(reverseGeoCodeResult: result);
  }
}