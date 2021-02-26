import 'package:circuit_diary/app/state/car_state.dart';
import 'package:circuit_diary/app/state_notifier/car_state_notifier.dart';
import 'package:circuit_diary/app/ui/widget/carmanagement/edit_car.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarTabList extends StatelessWidget {
  final tabs = [
    Tab(text: "車両"),
    Tab(text: "メンテナンス"),
  ];

  @override
  Widget build(BuildContext context) {
    final carStateNotifier = Provider.of<CarStateNotifier>(context, listen: false);
    final carState = Provider.of<CarState>(context, listen: true);

    return DefaultTabController(
        length: tabs.length,
        child: Builder(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("${carState.editName}の管理"),
              leading: BackButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                  carStateNotifier.clearEdit();
                },
              ),
              bottom: TabBar(tabs: tabs),
              actions: [
                IconButton(
                    icon: Icon(Icons.delete, color: Colors.white),
                    onPressed: () {})
              ],
            ),
            body: TabBarView(
              children: [
                EditCar(hasAppBar: false),
                Container(),
              ],
            ),
          );
        }));
  }
}
