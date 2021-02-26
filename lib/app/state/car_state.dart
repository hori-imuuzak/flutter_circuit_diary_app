import 'dart:io';

import 'package:circuit_diary/app/domain/entity/car.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_state.freezed.dart';

@freezed
abstract class CarState with _$CarState {

  factory CarState({
    List<Car> carList,
    String name,
    String odo,
    File image,
    bool isUpdate,
    bool isSaved,
  }) = _CarState;
}
