import 'package:circuit_diary/app/domain/entity/car_maintenance.dart';
import 'package:circuit_diary/app/domain/entity/maintenance_type.dart';

class Gas implements CarMaintenance {
  Gas({
    this.doneAt,
    this.liter,
    this.price,
  });

  final int liter;
  final int price;

  final type = MaintenanceType.Gas;
  final DateTime doneAt;
}