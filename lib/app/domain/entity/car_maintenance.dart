import 'package:circuit_diary/app/domain/entity/maintenance_type.dart';

abstract class CarMaintenance {
  CarMaintenance({
    this.type,
    this.doneAt,
  });

  final MaintenanceType type;
  final DateTime doneAt;
}