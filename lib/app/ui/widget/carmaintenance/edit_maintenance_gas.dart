import 'package:circuit_diary/app/state/car_maintenance_state.dart';
import 'package:circuit_diary/app/state_notifier/car_maintenance_state_notifier.dart';
import 'package:circuit_diary/app/ui/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditMaintenanceGas extends StatelessWidget {
  final _dateText = TextEditingController();
  final _literText = TextEditingController();
  final _priceText = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final maintenanceStateNotifier =
        Provider.of<CarMaintenanceStateNotifier>(context, listen: false);
    final maintenanceState =
        Provider.of<CarMaintenanceState>(context, listen: true);

    final editingGas = maintenanceState.editingGas;
    _dateText.value =
        _dateText.value.copyWith(text: editingGas?.doneAt?.toString() ?? "");
    _literText.value =
        _literText.value.copyWith(text: editingGas?.liter?.toString() ?? "");
    _priceText.value =
        _priceText.value.copyWith(text: editingGas?.price?.toString() ?? "");

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ガソリン"),
          leading: BackButton(onPressed: () {
            maintenanceStateNotifier.clear();
            Navigator.of(context).pop();
          }),
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
                  validator: maintenanceStateNotifier.getEmptyValidator(),
                  readOnly: true,
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().add(new Duration(days: -365)),
                      lastDate: DateTime.now().add(new Duration(days: 365)),
                    );
                    maintenanceStateNotifier.editGas(doneAt: picked);
                  },
                ),
                TextFormField(
                  controller: _literText,
                  decoration: const InputDecoration(
                    hintText: "給油量を入力してください",
                    labelText: "給油量（リットル）",
                  ),
                  keyboardType: TextInputType.number,
                  validator: maintenanceStateNotifier.getEmptyValidator(),
                  onChanged: (String value) {
                    maintenanceStateNotifier.editGas(liter: value);
                  },
                ),
                TextFormField(
                  controller: _priceText,
                  decoration: const InputDecoration(
                    hintText: "価格を入力してください。",
                    labelText: "価格（任意）",
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onChanged: (String value) {
                    maintenanceStateNotifier.editGas(price: value);
                  },
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
                onPressed: maintenanceState.isSaved ? null : () {
                  if (_formKey.currentState.validate()) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    _formKey.currentState.save();

                    maintenanceStateNotifier.saveGas();
                  }
                },
                child: Text("保存する"),
                textColor: Colors.white,
              )),
        ),
      ),
    );
  }
}
