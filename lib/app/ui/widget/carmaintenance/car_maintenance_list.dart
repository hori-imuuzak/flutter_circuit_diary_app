import 'package:circuit_diary/app/domain/entity/maintenance_type.dart';
import 'package:circuit_diary/app/ui/style.dart';
import 'package:circuit_diary/app/ui/widget/carmaintenance/car_maintenance_item.dart';
import 'package:circuit_diary/app/ui/widget/carmaintenance/edit_maintenance_cost.dart';
import 'package:circuit_diary/app/ui/widget/carmaintenance/edit_maintenance_gas.dart';
import 'package:circuit_diary/app/ui/widget/carmaintenance/edit_maintenance_repair.dart';
import 'package:circuit_diary/app/ui/widget/icon/svg_icon.dart';
import 'package:circuit_diary/app/ui/widget/transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CarMaintenanceList extends StatelessWidget {
  final _transition = Transition();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            var type = [
              MaintenanceType.Gas,
              MaintenanceType.Cost,
              MaintenanceType.Repair,
            ];
            return CarMaintenanceItem(type: type[index]);
          }),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0, color: Colors.white),
        backgroundColor: Colors.blue,
        curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
            child: SvgIcon(assetName: "images/icon_repair.svg",size: 24),
            backgroundColor: ThemeColor.Repair,
            label: "整備・修理",
            onTap: () {
              Navigator.of(context).push(_toEditMaintenance(_transition, EditMaintenanceRepair()));
            },
          ),
          SpeedDialChild(
            child: SvgIcon(assetName: "images/icon_gas.svg",size: 24),
            backgroundColor: ThemeColor.Gas,
            label: "ガソリン",
            onTap: () {
              Navigator.of(context).push(_toEditMaintenance(_transition, EditMaintenanceGas()));
            },
          ),
          SpeedDialChild(
            child: SvgIcon(assetName: "images/icon_money.svg",size: 24),
            backgroundColor: ThemeColor.Cost,
            label: "経費",
            onTap: () {
              Navigator.of(context).push(_toEditMaintenance(_transition, EditMaintenanceCost()));
            },
          ),
        ],
      ),
    );
  }
}

Route _toEditMaintenance(Transition transition, Widget screen) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return transition.getTransition(animation, child);
      }
  );
}

