import 'dart:io';

import 'package:circuit_diary/app/state/track_state.dart';
import 'package:circuit_diary/app/state_notifier/track_state_notifier.dart';
import 'package:circuit_diary/app/ui/style.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditTrack extends StatefulWidget {
  EditTrack({this.track});

  final Object track;

  @override
  State createState() => _EditTrackState(track: this.track);
}

class _EditTrackState extends State<EditTrack> {
  _EditTrackState({this.track});

  final Object track;

  String _trackName;
  String _trackAddress;
  LatLng _trackLatLng;
  String _trackUrl;
  String _trackMemo;
  File _file;
  final _formKey = GlobalKey<FormState>();
  final _addressTextController = TextEditingController();
  GoogleMapController _mapController;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final trackStateNotifier = Provider.of<TrackStateNotifier>(context, listen: false);
    final trackState = Provider.of<TrackState>(context, listen: true);

    _addressTextController.value = _addressTextController.value.copyWith(text: trackState.reverseGeoCodeResult);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_getTitle(this.track)),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Space.M),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "名前を入力してください",
                      labelText: "コース名",
                    ),
                    keyboardType: TextInputType.text,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "入力してください";
                      }

                      return null;
                    },
                    onSaved: (String value) {
                      setState(() {
                        _trackName = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "郵便番号を入力してください",
                      labelText: "郵便番号（ハイフン-なし）",
                    ),
                    keyboardType: TextInputType.number,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "入力してください";
                      }

                      return null;
                    },
                    onSaved: (String value) {
                      setState(() {
                        _trackAddress = value;
                      });
                    },
                  ),
                  TextFormField(
                    controller: _addressTextController,
                    decoration: const InputDecoration(
                      hintText: "所在地を入力してください",
                      labelText: "所在地",
                    ),
                    keyboardType: TextInputType.streetAddress,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "入力してください";
                      }

                      return null;
                    },
                    onSaved: (String value) {
                      setState(() {
                        _trackAddress = value;
                      });
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
                        target: LatLng(35.652832, 139.839478),
                        zoom: 13,
                      ),
                      myLocationEnabled: false,
                      myLocationButtonEnabled: false,
                      markers: _getMarkers(),
                      onMapCreated: (GoogleMapController controller) {
                        setState(() {
                          _mapController = controller;
                        });
                      },
                      zoomControlsEnabled: true,
                      zoomGesturesEnabled: true,
                      onTap: (LatLng latlng) {
                        trackStateNotifier.reverseGeoCoding(latlng.latitude, latlng.longitude);
                        setState(() {
                          _trackLatLng = latlng;
                        });
                      },
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
                                onTap: () async {
                                  final pickedImage = await _picker.getImage(
                                      source: ImageSource.gallery);
                                  setState(() {
                                    if (pickedImage != null) {
                                      _file = File(pickedImage.path);
                                    } else {
                                      // TODO failed pick
                                    }
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(top: Space.S),
                                  child: _getImage(),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "URLを入力してください。",
                      labelText: "URL（任意）",
                    ),
                    keyboardType: TextInputType.url,
                    onSaved: (String value) {
                      setState(() {
                        _trackUrl = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "営業時間、注意事項など",
                      labelText: "メモ（任意）",
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.text,
                    onSaved: (String value) {
                      setState(() {
                        _trackMemo = value;
                      });
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

  Set<Marker> _getMarkers() {
    final markers = Set<Marker>();
    if (_trackLatLng != null) {
      markers.add(Marker(markerId: MarkerId("mark"), position: _trackLatLng));
    }

    return markers;
  }

  Widget _getImage() {
    if (_file != null) {
      return Image.file(_file, width: 256.0);
    } else {
      return Image.asset("images/track_default.png", width: 320.0);
    }
  }
}
