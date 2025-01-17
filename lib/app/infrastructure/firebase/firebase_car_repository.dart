import 'dart:io';

import 'package:circuit_diary/app/domain/entity/car.dart';
import 'package:circuit_diary/app/domain/repository/car_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseCarRepository implements CarRepository {

  @override
  Future<List<Car>> list() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final snapshots = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .collection("cars")
        .get();

      List<Car> cars = [];
      snapshots.docs.forEach((doc) {
        final data = doc.data();
        cars.add(Car(
          uid: doc.id,
          name: data["name"],
          odo: data["odo"],
          imageUrl: data["imageUrl"],
        ));
      });

      return cars;
    } catch (_) {
      return [];
    }
  }

  @override
  Future<Car> create(Car car) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final ref = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .collection("cars")
          .add(car.toMap());

      return Car(
        uid: ref.id,
        name: car.name,
        odo: car.odo,
        imageUrl: car.imageUrl,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Future<Car> update(String uid, Car car) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<String> updateImage(String uid, File image) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(String uid) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}