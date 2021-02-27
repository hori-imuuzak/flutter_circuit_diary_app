import 'package:circuit_diary/app/ui/style.dart';
import 'package:circuit_diary/app/ui/widget/carmaintenance/maintenance_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditMaintenanceRepair extends StatelessWidget {
  final _nameText = TextEditingController();

  final _dateText = TextEditingController();
  final _odoText = TextEditingController();
  final _priceText = TextEditingController();
  final _noteText = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("整備・修理"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Space.M),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _dateText,
                    decoration: const InputDecoration(
                      labelText: "発生日",
                    ),
                    validator: (String value) {
                      return "";
                    },
                    readOnly: true,
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().add(new Duration(days: -365)),
                        lastDate: DateTime.now().add(new Duration(days: 365)),
                      );
                      print(picked);
                      _dateText.value =
                          _dateText.value.copyWith(text: "2021/02/27");
                    },
                  ),
                  MaintenanceInputField(nameTextController: _nameText, canDelete: false),
                  MaintenanceInputField(nameTextController: _nameText, canDelete: true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RaisedButton(
                          onPressed: () {}, child: const Text("項目を追加する")),
                    ],
                  ),
                  TextFormField(
                    controller: _odoText,
                    decoration: const InputDecoration(
                      hintText: "走行距離を入力してください",
                      labelText: "走行距離（km）",
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    validator: (String value) {
                      return "";
                    },
                    onChanged: (String value) {},
                  ),
                  TextFormField(
                    controller: _priceText,
                    decoration: const InputDecoration(
                      hintText: "価格を入力してください。",
                      labelText: "価格（任意）",
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    validator: (String value) {
                      return "";
                    },
                    onChanged: (String value) {},
                  ),
                  TextFormField(
                    controller: _noteText,
                    decoration: const InputDecoration(
                      hintText: "メモを入力してください。",
                      labelText: "メモ（任意）",
                    ),
                    keyboardType: TextInputType.text,
                    validator: (String value) {
                      return "";
                    },
                    onChanged: (String value) {},
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
                  // if (_formKey.currentState.validate()) {
                  //   FocusScope.of(context).requestFocus(FocusNode());
                  //   _formKey.currentState.save();
                  //
                  //   trackStateNotifier.createTrack();
                  // }
                },
                child: Text("保存する"),
                textColor: Colors.white,
              )),
        ),
      ),
    );
  }
}
