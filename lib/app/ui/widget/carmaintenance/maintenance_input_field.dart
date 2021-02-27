import 'package:flutter/material.dart';

class MaintenanceInputField extends StatelessWidget {
  MaintenanceInputField(
      {this.canDelete, this.nameTextController, this.priceTextController});

  final bool canDelete;
  final TextEditingController nameTextController;
  final TextEditingController priceTextController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flex(direction: Axis.horizontal, children: [
          Flexible(
            child: TextFormField(
              controller: nameTextController,
              decoration: const InputDecoration(
                hintText: "例：オイル交換",
                labelText: "項目名",
              ),
              keyboardType: TextInputType.text,
              validator: (String value) {
                return "";
              },
              onChanged: (String value) {},
            ),
          ),
          Flexible(
            child: TextFormField(
              controller: priceTextController,
              decoration: const InputDecoration(
                hintText: "10000",
                labelText: "価格（任意）",
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              validator: (String value) {
                return "";
              },
              onChanged: (String value) {},
            ),
          ),
          canDelete ? IconButton(icon: Icon(Icons.clear), onPressed: () {}) : Container(width: 48),
        ]),
        // TODO delete
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
