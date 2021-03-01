import 'package:circuit_diary/app/state/car_maintenance_state.dart';
import 'package:circuit_diary/app/state_notifier/car_maintenance_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MaintenanceInputField extends StatelessWidget {
  MaintenanceInputField({this.index, this.canDelete});

  final int index;
  final bool canDelete;
  final _nameTextController = TextEditingController();
  final _priceTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final carMaintenanceStateNotifier =
        Provider.of<CarMaintenanceStateNotifier>(context, listen: false);
    final carMaintenanceState =
        Provider.of<CarMaintenanceState>(context, listen: true);

    final maintenanceItem =
        carMaintenanceState.editingRepair?.maintenanceItemList[index];

    _nameTextController.value =
        _nameTextController.value.copyWith(text: maintenanceItem?.name ?? "");
    _nameTextController.selection = TextSelection.fromPosition(
        TextPosition(offset: _nameTextController.text.length));

    _priceTextController.value = _priceTextController.value.copyWith(
        text:
            maintenanceItem?.price != null ? "${maintenanceItem?.price}" : "");
    _priceTextController.selection = TextSelection.fromPosition(
        TextPosition(offset: _priceTextController.text.length));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flex(direction: Axis.horizontal, children: [
          Flexible(
            child: TextFormField(
              controller: _nameTextController,
              decoration: const InputDecoration(
                hintText: "例：オイル交換",
                labelText: "項目名",
              ),
              keyboardType: TextInputType.text,
              validator: carMaintenanceStateNotifier.getEmptyValidator(),
              onChanged: (String value) {
                carMaintenanceStateNotifier.editMaintenanceItem(
                    index: index, name: value);
              },
            ),
          ),
          Flexible(
            child: TextFormField(
              controller: _priceTextController,
              decoration: const InputDecoration(
                hintText: "10000",
                labelText: "価格（任意）",
              ),
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                carMaintenanceStateNotifier.editMaintenanceItem(
                    index: index, price: value);
              },
            ),
          ),
          canDelete
              ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    carMaintenanceStateNotifier.removeMaintenanceItem(index);
                  },
                )
              : Container(width: 48),
        ]),
        FlatButton(
          onPressed: () {},
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.history),
            const Text("履歴から選ぶ"),
          ]),
        ),
      ],
    );
  }
}
