import 'package:circuit_diary/app/domain/entity/car_maintenance.dart';
import 'package:circuit_diary/app/domain/entity/maintenance_item.dart';
import 'package:circuit_diary/app/domain/entity/maintenance_type.dart';

class Repair implements CarMaintenance {
  Repair({
    this.doneAt,
    this.title,
    this.maintenanceItemList,
    this.odo,
    this.note,
  });

  final title;
  final List<MaintenanceItem> maintenanceItemList;
  final int odo;
  final String note;

  final type = MaintenanceType.Repair;
  final DateTime doneAt;

  String getTitle() {
    return maintenanceItemList.map((item) => item.name).join("/");
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "type": this.type.toString(),
      "title": this.getTitle(),
      "doneAt": this.doneAt,
      "odo": this.odo,
      "note": this.note,
    };
  }

  List<Map<String, dynamic>> toMapListMaintenanceItemList() {
    return this
        .maintenanceItemList
        .map((item) => ({
              "name": item.name,
              "price": item.price,
            }))
        .toList();
  }
}
