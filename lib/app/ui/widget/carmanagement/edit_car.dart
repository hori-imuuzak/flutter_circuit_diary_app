import 'dart:io';

import 'package:circuit_diary/app/domain/entity/car.dart';
import 'package:circuit_diary/app/state/car_state.dart';
import 'package:circuit_diary/app/state_notifier/car_state_notifier.dart';
import 'package:circuit_diary/app/ui/style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditCar extends StatefulWidget {
  EditCar();

  @override
  State createState() => _EditCarState();
}

class _EditCarState extends State<EditCar> {
  _EditCarState();

  String _carName;
  String _carODO;
  File _file;
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final carState = Provider.of<CarState>(context, listen: false);
      final editingCar = carState.editingCar;

      _carName = editingCar.name;
      _carODO = "${editingCar.odo}";
    });
  }

  @override
  Widget build(BuildContext context) {
    final carStateNotifier = Provider.of<CarStateNotifier>(context, listen: false);
    final carState = Provider.of<CarState>(context, listen: false);

    final editingCar = carState.editingCar;

    final List<Widget> actions = [];
    if (editingCar != null) {
      actions.add(IconButton(icon: Icon(Icons.delete, color: Colors.white), onPressed: () {}));
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_getTitle(editingCar)),
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
              carStateNotifier.editCar(null);
            },
          ),
          actions: actions,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Space.M),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: editingCar != null ? editingCar.name : "",
                  decoration: const InputDecoration(
                    hintText: "名前を入力してください",
                    labelText: "車両名",
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "入力してください";
                    }

                    return null;
                  },
                  onSaved: (String value) {
                    setState(() {
                      _carName = value;
                    });
                  },
                ),
                TextFormField(
                  initialValue: editingCar != null ? "${editingCar.odo}" : "",
                  decoration: const InputDecoration(
                    hintText: "走行距離を入力してください",
                    labelText: "走行距離km（初期値）",
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
                      _carODO = value;
                    });
                  },
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
              ],
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

                    carStateNotifier.createCar(Car(
                      name: _carName,
                      odo: int.parse(_carODO),
                      imageUrl: "",
                    ));
                  }
                },
                child: Text(carState.isSaved ? "保存しました" : "保存する"),
                textColor: Colors.white,
              )),
        ),
      ),
    );
  }

  Widget _getImage() {
    if (_file != null) {
      return Image.file(_file, width: 256.0);
    } else {
      return Image.asset("images/car_default.png", width: 320.0);
    }
  }

  String _getTitle(Car car) {
    if (car == null) {
      return "車両追加";
    } else {
      return "${car.name}を編集";
    }
  }
}
