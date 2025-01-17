import 'package:circuit_diary/app/domain/entity/car_maintenance.dart';
import 'package:circuit_diary/app/domain/entity/cost.dart';
import 'package:circuit_diary/app/domain/entity/gas.dart';
import 'package:circuit_diary/app/domain/entity/maintenance_type.dart';
import 'package:circuit_diary/app/domain/entity/repair.dart';
import 'package:circuit_diary/app/ui/style.dart';
import 'package:circuit_diary/app/ui/widget/icon/svg_icon.dart';
import 'package:flutter/material.dart';

class CarMaintenanceItem extends StatelessWidget {
  CarMaintenanceItem({this.carMaintenance}) : assert(carMaintenance != null);

  final CarMaintenance carMaintenance;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide.none,
                    left: BorderSide.none,
                    right: BorderSide.none,
                    bottom: BorderSide(width: 0.0, color: Colors.grey))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Space.S),
              child: Row(
                children: [
                  // アイコン
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 10,
                        height: 66,
                        color: Colors.black,
                      ),
                      Container(
                          width: 44.0,
                          height: 44.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _getTypeColor(carMaintenance.type)),
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: SvgIcon(
                                  assetName: _getIconName(carMaintenance.type), size: 24))),
                    ],
                  ),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(left: Space.XS),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // タイトル、日時
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(_getTitle(carMaintenance),
                                      style: TextStyle(
                                          fontSize: FontSize.HEAD,
                                          fontWeight: FontWeight.bold)),
                                  Text(carMaintenance.doneAt.toString(),
                                      style: TextStyle(
                                          fontSize: FontSize.SUB,
                                          color: Colors.black45)),
                                ],
                              ),
                              // 走行距離
                              Text("138,000km",
                                  style: TextStyle(fontSize: FontSize.SUB)),
                            ],
                          ))),
                ],
              ),
            )));
  }

  String _getTitle(CarMaintenance carMaintenance) {
    if (carMaintenance is Repair) {
      return carMaintenance.title;
    } else if (carMaintenance is Gas) {
      return "ガソリン";
    } else if (carMaintenance is Cost) {
      return carMaintenance.name;
    }

    return "タイトルなし";
  }

  Color _getTypeColor(MaintenanceType type) {
    switch (type) {
      case MaintenanceType.Cost:
        return ThemeColor.Cost;
      case MaintenanceType.Gas:
        return ThemeColor.Gas;
      case MaintenanceType.Repair:
        return ThemeColor.Repair;
    }

    return Colors.white;
  }

  String _getIconName(MaintenanceType type) {
    switch (type) {
      case MaintenanceType.Cost:
        return "images/icon_money.svg";
      case MaintenanceType.Gas:
        return "images/icon_gas.svg";
      case MaintenanceType.Repair:
        return "images/icon_repair.svg";
    }

    return "";
  }
}
