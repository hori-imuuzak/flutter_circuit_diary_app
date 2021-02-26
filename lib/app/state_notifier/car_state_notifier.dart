import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:circuit_diary/app/domain/entity/car.dart';
import 'package:circuit_diary/app/domain/repository/car_repository.dart';
import 'package:circuit_diary/app/state/car_state.dart';

class CarStateNotifier extends StateNotifier<CarState> {

  CarStateNotifier(this._read): super(
    CarState(
        carList: [],
        editName: "",
        name: "",
        odo: "",
        image: null,
        isUpdate: false,
        isSaved: false,
    )
  );

  final T Function<T>() _read;

  CarRepository get _carRepository => _read<CarRepository>();

  final _picker = ImagePicker();

  // 車両作成
  Future<void> createCar() async {
    var car = Car(
      name: state.name,
      odo: int.parse(state.odo),
      imageUrl: "",
    );
    await this._carRepository.create(car);

    // TODO error handle
    state.carList.add(car);
    state = state.copyWith(
      isSaved: true,
    );

    await Future.delayed(Duration(seconds: 2));

    state = state.copyWith(
      isSaved: false,
    );
  }

  // 車両一覧取得
  Future<void> fetchCarList() async {
    var carList = await this._carRepository.list();

    // TODO error handle
    state = state.copyWith(
      carList: carList,
    );
  }

  // 名前の入力
  void setName(String value) {
    state = state.copyWith(
      name: value,
    );
  }

  // 走行距離の入力
  void setOdo(String value) {
    state = state.copyWith(
      odo: value,
    );
  }

  // 画像の選択
  Future<void> pickImage() async {
    final pickedImage = await _picker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      state = state.copyWith(image: File(pickedImage.path));
    }
  }

  // 初期化
  void clearEdit() {
    state = state.copyWith(
      editName: "",
      name: "",
      odo: "",
      image: null,
      isUpdate: false,
    );
  }

  // 編集内容をセット
  void setEdit(Car car) {
    state = state.copyWith(
      editName: car.name,
      name: car.name,
      odo: "${car.odo}",
      image: null,
      isUpdate: true,
    );
  }

  Function getEmptyValidator() {
    return (String value) {
      if (value.isEmpty) {
        return "入力してください";
      }

      return null;
    };
  }
}