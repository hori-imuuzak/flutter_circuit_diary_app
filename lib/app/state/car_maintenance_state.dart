import 'package:circuit_diary/app/domain/entity/car.dart';
import 'package:circuit_diary/app/domain/entity/cost.dart';
import 'package:circuit_diary/app/domain/entity/gas.dart';
import 'package:circuit_diary/app/domain/entity/car_maintenance.dart';
import 'package:circuit_diary/app/domain/entity/repair.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_maintenance_state.freezed.dart';

@freezed
abstract class CarMaintenanceState with _$CarMaintenanceState {

  factory CarMaintenanceState({
    Car car,
    List<CarMaintenance> maintenanceList,

    Repair editingRepair,
    Gas editingGas,
    Cost editingCost,

    bool isUpdate,
    bool isSaved,
  }) = _CarMaintenanceState;
}
