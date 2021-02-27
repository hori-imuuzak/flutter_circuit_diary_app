import 'package:circuit_diary/app/domain/entity/car_maintenance.dart';
import 'package:circuit_diary/app/domain/entity/maintenance_type.dart';

class Cost implements CarMaintenance {
  Cost({
    this.doneAt,
    this.name,
    this.price,
  });

  final String name;
  final int price;

  final type = MaintenanceType.Cost;
  final DateTime doneAt;
}