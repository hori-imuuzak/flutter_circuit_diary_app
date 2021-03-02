import 'package:circuit_diary/app/domain/entity/car_maintenance.dart';
import 'package:circuit_diary/app/domain/entity/cost.dart';
import 'package:circuit_diary/app/domain/entity/gas.dart';
import 'package:circuit_diary/app/domain/entity/maintenance_type.dart';
import 'package:circuit_diary/app/domain/entity/repair.dart';
import 'package:circuit_diary/app/domain/repository/maintenance_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseMaintenanceRepository implements MaintenanceRepository {
  @override
  Future<List<CarMaintenance>> list(String carUid) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final snapshots = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .collection("cars")
          .doc(carUid)
          .collection("maintenance")
          .get();

      List<CarMaintenance> maintenances = [];
      snapshots.docs.forEach((doc) {
        final data = doc.data();
        switch (maintenanceTypeStrToMaintenanceType[data["type"] ?? ""]) {
          case MaintenanceType.Repair:
            maintenances.add(Repair(
              doneAt: (data["doneAt"] as Timestamp).toDate(),
              odo: data["odo"],
              note: data["note"],
            ));
            break;
          case MaintenanceType.Gas:
            maintenances.add(Gas(
              doneAt: (data["doneAt"] as Timestamp).toDate(),
              liter: data["liter"],
              price: data["price"],
            ));
            break;
          case MaintenanceType.Cost:
            maintenances.add(Cost(
              doneAt: (data["doneAt"] as Timestamp).toDate(),
              name: data["name"],
              price: data["price"],
            ));
            break;
        }
      });

      return maintenances;
    } catch (_) {
      return [];
    }
  }

  @override
  Future<CarMaintenance> create(
      String carUid, CarMaintenance maintenance) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final res = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .collection("cars")
          .doc(carUid)
          .collection("maintenance")
          .add(maintenance.toMap());

      if (maintenance is Repair) {
        await Future.wait(
            maintenance.toMapListMaintenanceItemList().map((item) async {
          await res.collection("maintenance_item").add(item);
        }));
      }

      return maintenance;
    }

    return null;
  }

  @override
  Future<CarMaintenance> update(
      String carUid, CarMaintenance maintenance) async {
    return null;
  }

  @override
  Future<bool> delete(String carUid, CarMaintenance maintenance) async {
    return false;
  }
}
