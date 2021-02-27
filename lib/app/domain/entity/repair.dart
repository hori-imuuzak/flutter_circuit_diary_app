import 'package:circuit_diary/app/domain/entity/car_maintenance.dart';
import 'package:circuit_diary/app/domain/entity/maintenance_item.dart';
import 'package:circuit_diary/app/domain/entity/maintenance_type.dart';

class Repair implements CarMaintenance {
  Repair({
    this.doneAt,
    this.maintenanceItemList,
    this.odo,
    this.note,
  });

  final List<MaintenanceItem> maintenanceItemList;
  final int odo;
  final String note;

  final type = MaintenanceType.Repair;
  final DateTime doneAt;
}