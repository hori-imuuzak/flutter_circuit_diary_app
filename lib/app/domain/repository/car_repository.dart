import 'dart:io';
import 'package:circuit_diary/app/domain/entity/car.dart';

class CarRepository {
  Future<List<Car>> list() => Future.value([]);
  Future<Car> create(Car car) => Future.value(Car());
  Future<Car> update(String uid, Car car) => Future.value(Car());
  Future<bool> delete(String uid) => Future.value(false);
  Future<String> updateImage(String uid, File image) => Future.value("image_url");
}