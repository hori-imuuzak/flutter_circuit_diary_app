import 'dart:io';

import 'package:circuit_diary/app/state/car_state.dart';
import 'package:circuit_diary/app/state_notifier/car_state_notifier.dart';
import 'package:circuit_diary/app/ui/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditCar extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final _nameText = TextEditingController();
  final _odoText = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final carStateNotifier = Provider.of<CarStateNotifier>(context, listen: false);
    final carState = Provider.of<CarState>(context, listen: true);

    final List<Widget> actions = [];
    if (carState.isUpdate) {
      actions.add(IconButton(icon: Icon(Icons.delete, color: Colors.white), onPressed: () {}));
    }

    _nameText.value = _nameText.value.copyWith(text: carState.name);
    _odoText.value = _odoText.value.copyWith(text: carState.odo);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_getTitle(carState.editName)),
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
              carStateNotifier.clearEdit();
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
                  controller: _nameText,
                  decoration: const InputDecoration(
                    hintText: "名前を入力してください",
                    labelText: "車両名",
                  ),
                  validator: carStateNotifier.getEmptyValidator(),
                  onChanged: (String value) {
                    carStateNotifier.setName(value);
                  },
                ),
                TextFormField(
                  controller: _odoText,
                  decoration: const InputDecoration(
                    hintText: "走行距離を入力してください",
                    labelText: "走行距離km（初期値）",
                  ),
                  keyboardType: TextInputType.number,
                  validator: carStateNotifier.getEmptyValidator(),
                  onChanged: (String value) {
                    carStateNotifier.setOdo(value);
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
                              onTap: carStateNotifier.pickImage,
                              child: Padding(
                                padding: EdgeInsets.only(top: Space.S),
                                child: _getImage(carState.image),
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

                    carStateNotifier.createCar();
                  }
                },
                child: Text(carState.isSaved ? "保存しました" : "保存する"),
                textColor: Colors.white,
              )),
        ),
      ),
    );
  }

  Widget _getImage(File file) {
    if (file != null) {
      return Image.file(file, width: 256.0);
    } else {
      return Image.asset("images/car_default.png", width: 320.0);
    }
  }

  String _getTitle(String editName) {
    if (editName == "") {
      return "車両追加";
    } else {
      return "$editNameを編集";
    }
  }
}
