import 'package:circuit_diary/app/domain/entity/car.dart';

class CarState {
  CarState({
    this.carList,
    this.editingCar,
    this.isSaved,
  });

  final List<Car> carList;
  final Car editingCar;
  final bool isSaved;
}