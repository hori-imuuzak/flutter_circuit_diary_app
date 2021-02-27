import 'package:circuit_diary/app/ui/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditMaintenanceGas extends StatelessWidget {
  final _dateText = TextEditingController();
  final _amountText = TextEditingController();
  final _priceText = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ガソリン"),
        ),
        body: Padding(
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
                    _dateText.value = _dateText.value.copyWith(text: "2021/02/27");
                  },
                ),
                TextFormField(
                  controller: _amountText,
                  decoration: const InputDecoration(
                    hintText: "給油量を入力してください",
                    labelText: "給油量（リットル）",
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
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
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (String value) {
                    return "";
                  },
                  onChanged: (String value) {},
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
