import 'dart:io';

import 'package:circuit_diary/app/state/track_state.dart';
import 'package:circuit_diary/app/state_notifier/track_state_notifier.dart';
import 'package:circuit_diary/app/ui/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class EditTrack extends StatefulWidget {
  EditTrack();

  @override
  State createState() => _EditTrackState();
}

class _EditTrackState extends State<EditTrack> {
  _EditTrackState();

  final _formKey = GlobalKey<FormState>();
  final _nameText = TextEditingController();
  final _postalCodeText = TextEditingController();
  final _addressText = TextEditingController();
  final _urlText = TextEditingController();
  final _memoText = TextEditingController();

  @override
  void dispose() {
    _nameText.dispose();
    _postalCodeText.dispose();
    _addressText.dispose();
    _urlText.dispose();
    _memoText.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final trackStateNotifier =
        Provider.of<TrackStateNotifier>(context, listen: false);
    final trackState = Provider.of<TrackState>(context, listen: true);

    _nameText.value = _nameText.value.copyWith(text: trackState.trackName);
    _postalCodeText.value =
        _postalCodeText.value.copyWith(text: trackState.postalCode);
    _addressText.value = _addressText.value.copyWith(text: trackState.address);
    _urlText.value = _urlText.value.copyWith(text: trackState.url);
    _memoText.value = _memoText.value.copyWith(text: trackState.memo);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_getTitle(null)),
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
              trackStateNotifier.clearEdit();
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Space.M),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameText,
                    decoration: const InputDecoration(
                      hintText: "名前を入力してください",
                      labelText: "コース名",
                    ),
                    keyboardType: TextInputType.text,
                    validator: trackStateNotifier.getEmptyValidator(),
                    onSaved: (String value) {
                      trackStateNotifier.setTrackName(value);
                    },
                  ),
                  TextFormField(
                    controller: _postalCodeText,
                    decoration: const InputDecoration(
                      hintText: "郵便番号を入力してください",
                      labelText: "郵便番号（ハイフン-なし）",
                    ),
                    keyboardType: TextInputType.number,
                    validator: trackStateNotifier.getEmptyValidator(),
                    onChanged: (String value) {
                      trackStateNotifier.setPostalCode(value);
                    },
                  ),
                  TextFormField(
                    controller: _addressText,
                    decoration: const InputDecoration(
                      hintText: "所在地を入力してください",
                      labelText: "所在地",
                    ),
                    keyboardType: TextInputType.streetAddress,
                    validator: trackStateNotifier.getEmptyValidator(),
                    onSaved: (String value) {
                      trackStateNotifier.setAddress(value);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: Space.S),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("地図をタップすることで住所を取得できます。",
                            style: TextStyle(fontSize: FontSize.CAPTION)),
                      ],
                    ),
                  ),
                  LimitedBox(
                    maxHeight: 240,
                    child: GoogleMap(
                      mapType: MapType.terrain,
                      initialCameraPosition: CameraPosition(
                        target:
                            LatLng(trackState.latitude, trackState.longitude),
                        zoom: 13,
                      ),
                      myLocationEnabled: false,
                      myLocationButtonEnabled: false,
                      markers: _getMarkers(
                          trackState.latitude, trackState.longitude),
                      onMapCreated: (GoogleMapController controller) {},
                      zoomControlsEnabled: true,
                      zoomGesturesEnabled: true,
                      onTap: (LatLng latlng) {
                        trackStateNotifier.reverseGeoCoding(
                            latlng.latitude, latlng.longitude);
                      },
                      gestureRecognizers: Set()
                        ..add(Factory<PanGestureRecognizer>(
                            () => PanGestureRecognizer())),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: Space.L),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("写真を選択してください（任意）",
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: FontSize.LABEL)),
                            GestureDetector(
                                onTap: trackStateNotifier.pickImage,
                                child: Padding(
                                  padding: EdgeInsets.only(top: Space.S),
                                  child: _getImage(trackState.image),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: _urlText,
                    decoration: const InputDecoration(
                      hintText: "URLを入力してください。",
                      labelText: "URL（任意）",
                    ),
                    keyboardType: TextInputType.url,
                    onSaved: (String value) {
                      trackStateNotifier.setUrl(value);
                    },
                  ),
                  TextFormField(
                    controller: _memoText,
                    decoration: const InputDecoration(
                      hintText: "営業時間、注意事項など",
                      labelText: "メモ（任意）",
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.text,
                    onSaved: (String value) {
                      trackStateNotifier.setMemo(value);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(Space.S),
          child: ButtonTheme(
              minWidth: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    _formKey.currentState.save();
                  }
                },
                child: Text("保存する"),
                textColor: Colors.white,
              )),
        ),
      ),
    );
  }

  String _getTitle(Object car) {
    if (car == null) {
      return "コース追加";
    } else {
      return "富士スピードウェイを編集";
    }
  }

  Set<Marker> _getMarkers(double latitude, double longitude) {
    final markers = Set<Marker>();
    markers.add(Marker(
        markerId: MarkerId("mark"), position: LatLng(latitude, longitude)));

    return markers;
  }

  Widget _getImage(File file) {
    if (file != null) {
      return Image.file(file, width: 256.0);
    } else {
      return Image.asset("images/track_default.png", width: 320.0);
    }
  }
}
