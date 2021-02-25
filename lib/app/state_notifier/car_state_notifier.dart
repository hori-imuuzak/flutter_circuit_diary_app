import 'package:state_notifier/state_notifier.dart';

import 'package:circuit_diary/app/domain/entity/car.dart';
import 'package:circuit_diary/app/domain/repository/car_repository.dart';
import 'package:circuit_diary/app/state/car_state.dart';

class CarStateNotifier extends StateNotifier<CarState> {

  CarStateNotifier(this._read): super(
    CarState(carList: [], editingCar: null, isSaved: false)
  );

  final T Function<T>() _read;

  CarRepository get _carRepository => _read<CarRepository>();

  Future<void> createCar(Car car) async {
    await this._carRepository.create(car);

    // TODO error handle
    state.carList.add(car);
    state = CarState(
      carList: state.carList,
      editingCar: state.editingCar,
      isSaved: true,
    );

    await Future.delayed(Duration(seconds: 2));

    state = CarState(
      carList: state.carList,
      editingCar: state.editingCar,
      isSaved: false,
    );
  }

  Future<void> fetchCarList() async {
    var carList = await this._carRepository.list();

    // TODO error handle
    state = CarState(
      carList: carList,
      editingCar: state.editingCar,
      isSaved: state.isSaved,
    );
  }
}