import 'package:circuit_diary/app/domain/entity/car_maintenance.dart';
import 'package:circuit_diary/app/domain/entity/maintenance_type.dart';

class Gas implements CarMaintenance {
  Gas({
    this.doneAt,
    this.liter,
    this.price,
  });

  final double liter;
  final int price;

  final type = MaintenanceType.Gas;
  final DateTime doneAt;

  @override
  Map<String, dynamic> toMap() {
    return {
      "type": this.type.toString(),
      "doneAt": this.doneAt,
      "liter": this.liter,
      "price": this.price,
    };
  }
}