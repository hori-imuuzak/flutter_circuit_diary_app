import 'package:circuit_diary/app/state/car_maintenance_state.dart';
import 'package:circuit_diary/app/state_notifier/car_maintenance_state_notifier.dart';
import 'package:circuit_diary/app/ui/style.dart';
import 'package:circuit_diary/app/ui/widget/carmaintenance/maintenance_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditMaintenanceRepair extends StatelessWidget {
  final _dateText = TextEditingController();
  final _odoText = TextEditingController();
  final _noteText = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final carMaintenanceStateNotifier =
        Provider.of<CarMaintenanceStateNotifier>(context, listen: false);
    final carMaintenanceState =
        Provider.of<CarMaintenanceState>(context, listen: true);

    final editingRepair = carMaintenanceState.editingRepair;
    _dateText.value =
        _dateText.value.copyWith(text: editingRepair?.doneAt?.toString() ?? "");
    _odoText.value = _odoText.value.copyWith(
        text: editingRepair?.odo != null ? "${editingRepair?.odo}" : "");
    _noteText.value = _noteText.value.copyWith(text: editingRepair?.note ?? "");

    final List<Widget> maintenanceList = [];
    editingRepair?.maintenanceItemList?.asMap()?.forEach((index, item) {
      final canDelete = index > 0;
      maintenanceList
          .add(MaintenanceInputField(index: index, canDelete: canDelete));
    });

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
                    validator: carMaintenanceStateNotifier.getEmptyValidator(),
                    readOnly: true,
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().add(new Duration(days: -365)),
                        lastDate: DateTime.now().add(new Duration(days: 365)),
                      );
                      carMaintenanceStateNotifier.editRepair(doneAt: picked);
                    },
                  ),
                  ...maintenanceList,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RaisedButton(
                          onPressed: () {
                            carMaintenanceStateNotifier.addMaintenanceItem();
                          },
                          child: const Text("項目を追加する")),
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
                    validator: carMaintenanceStateNotifier.getEmptyValidator(),
                    onChanged: (String value) {
                      carMaintenanceStateNotifier.editRepair(odo: value);
                    },
                  ),
                  TextFormField(
                    controller: _noteText,
                    decoration: const InputDecoration(
                      hintText: "メモを入力してください。",
                      labelText: "メモ（任意）",
                    ),
                    keyboardType: TextInputType.text,
                    onChanged: (String value) {
                      carMaintenanceStateNotifier.editRepair(note: value);
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

                    // trackStateNotifier.createTrack();
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
