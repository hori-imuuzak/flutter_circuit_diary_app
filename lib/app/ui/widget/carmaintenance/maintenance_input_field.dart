import 'package:flutter/material.dart';

class MaintenanceInputField extends StatelessWidget {
  MaintenanceInputField({this.canDelete, this.nameTextController});

  final bool canDelete;
  final TextEditingController nameTextController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextFormField(
          controller: nameTextController,
          decoration: InputDecoration(
            hintText: "例：オイル交換",
            labelText: "項目名",
            suffixIcon: canDelete
                ? IconButton(icon: Icon(Icons.clear), onPressed: () {})
                : null,
          ),
          keyboardType: TextInputType.text,
          validator: (String value) {
            return "";
          },
          onChanged: (String value) {},
        ),
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
