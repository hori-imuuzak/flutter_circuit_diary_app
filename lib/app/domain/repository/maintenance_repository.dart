import 'package:circuit_diary/app/domain/entity/car_maintenance.dart';

class MaintenanceRepository {
  Future<List<CarMaintenance>> list() => Future.value([]);

  Future<CarMaintenance> create(String carUid, CarMaintenance maintenance) =>
      Future.value(null);

  Future<CarMaintenance> update(String carUid, CarMaintenance maintenance) =>
      Future.value(null);

  Future<bool> delete(String carUid, CarMaintenance maintenance) =>
      Future.value(false);
}
