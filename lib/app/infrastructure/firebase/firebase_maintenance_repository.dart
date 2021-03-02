import 'package:circuit_diary/app/domain/entity/car_maintenance.dart';
import 'package:circuit_diary/app/domain/entity/cost.dart';
import 'package:circuit_diary/app/domain/entity/gas.dart';
import 'package:circuit_diary/app/domain/entity/maintenance_item.dart';
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

      List<CarMaintenance> maintenanceList = [];
      snapshots.docs.forEach((doc) {
        final data = doc.data();
        switch (maintenanceTypeStrToMaintenanceType[data["type"] ?? ""]) {
          case MaintenanceType.Repair:
            final List<MaintenanceItem> maintenanceItemList = [];
            // final res = await doc.reference.collection("maintenance_item").get();
            // res.docs.map((item) {
            //   maintenanceItemList.add(MaintenanceItem(
            //     name: item.data()["name"],
            //     price: item.data()["price"],
            //   ));
            // });
            
            maintenanceList.add(Repair(
              doneAt: (data["doneAt"] as Timestamp).toDate(),
              title: data["title"],
              maintenanceItemList: maintenanceItemList,
              odo: data["odo"],
              note: data["note"],
            ));
            break;
          case MaintenanceType.Gas:
            maintenanceList.add(Gas(
              doneAt: (data["doneAt"] as Timestamp).toDate(),
              liter: data["liter"],
              price: data["price"],
            ));
            break;
          case MaintenanceType.Cost:
            maintenanceList.add(Cost(
              doneAt: (data["doneAt"] as Timestamp).toDate(),
              name: data["name"],
              price: data["price"],
            ));
            break;
        }
      });

      return maintenanceList;
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
