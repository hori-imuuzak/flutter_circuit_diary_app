import 'package:circuit_diary/app/domain/entity/car_maintenance.dart';
import 'package:circuit_diary/app/domain/repository/maintenance_repository.dart';

class FirebaseMaintenanceRepository implements MaintenanceRepository {

  @override
  Future<List<CarMaintenance>> list(String carUid) async {
    return [];
  }

  @override
  Future<CarMaintenance> create(String carUid,
      CarMaintenance maintenance) async {
    return null;
  }

  @override
  Future<CarMaintenance> update(String carUid,
      CarMaintenance maintenance) async {
    return null;
  }

  @override
  Future<bool> delete(String carUid, CarMaintenance maintenance) async {
    return false;
  }
}