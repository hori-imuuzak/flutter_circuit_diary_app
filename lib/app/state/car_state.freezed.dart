// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'car_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CarStateTearOff {
  const _$CarStateTearOff();

// ignore: unused_element
  _CarState call(
      {List<Car> carList,
      String editName,
      String name,
      String odo,
      File image,
      bool isUpdate,
      bool isSaved}) {
    return _CarState(
      carList: carList,
      editName: editName,
      name: name,
      odo: odo,
      image: image,
      isUpdate: isUpdate,
      isSaved: isSaved,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $CarState = _$CarStateTearOff();

/// @nodoc
mixin _$CarState {
  List<Car> get carList;
  String get editName;
  String get name;
  String get odo;
  File get image;
  bool get isUpdate;
  bool get isSaved;

  @JsonKey(ignore: true)
  $CarStateCopyWith<CarState> get copyWith;
}

/// @nodoc
abstract class $CarStateCopyWith<$Res> {
  factory $CarStateCopyWith(CarState value, $Res Function(CarState) then) =
      _$CarStateCopyWithImpl<$Res>;
  $Res call(
      {List<Car> carList,
      String editName,
      String name,
      String odo,
      File image,
      bool isUpdate,
      bool isSaved});
}

/// @nodoc
class _$CarStateCopyWithImpl<$Res> implements $CarStateCopyWith<$Res> {
  _$CarStateCopyWithImpl(this._value, this._then);

  final CarState _value;
  // ignore: unused_field
  final $Res Function(CarState) _then;

  @override
  $Res call({
    Object carList = freezed,
    Object editName = freezed,
    Object name = freezed,
    Object odo = freezed,
    Object image = freezed,
    Object isUpdate = freezed,
    Object isSaved = freezed,
  }) {
    return _then(_value.copyWith(
      carList: carList == freezed ? _value.carList : carList as List<Car>,
      editName: editName == freezed ? _value.editName : editName as String,
      name: name == freezed ? _value.name : name as String,
      odo: odo == freezed ? _value.odo : odo as String,
      image: image == freezed ? _value.image : image as File,
      isUpdate: isUpdate == freezed ? _value.isUpdate : isUpdate as bool,
      isSaved: isSaved == freezed ? _value.isSaved : isSaved as bool,
    ));
  }
}

/// @nodoc
abstract class _$CarStateCopyWith<$Res> implements $CarStateCopyWith<$Res> {
  factory _$CarStateCopyWith(_CarState value, $Res Function(_CarState) then) =
      __$CarStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Car> carList,
      String editName,
      String name,
      String odo,
      File image,
      bool isUpdate,
      bool isSaved});
}

/// @nodoc
class __$CarStateCopyWithImpl<$Res> extends _$CarStateCopyWithImpl<$Res>
    implements _$CarStateCopyWith<$Res> {
  __$CarStateCopyWithImpl(_CarState _value, $Res Function(_CarState) _then)
      : super(_value, (v) => _then(v as _CarState));

  @override
  _CarState get _value => super._value as _CarState;

  @override
  $Res call({
    Object carList = freezed,
    Object editName = freezed,
    Object name = freezed,
    Object odo = freezed,
    Object image = freezed,
    Object isUpdate = freezed,
    Object isSaved = freezed,
  }) {
    return _then(_CarState(
      carList: carList == freezed ? _value.carList : carList as List<Car>,
      editName: editName == freezed ? _value.editName : editName as String,
      name: name == freezed ? _value.name : name as String,
      odo: odo == freezed ? _value.odo : odo as String,
      image: image == freezed ? _value.image : image as File,
      isUpdate: isUpdate == freezed ? _value.isUpdate : isUpdate as bool,
      isSaved: isSaved == freezed ? _value.isSaved : isSaved as bool,
    ));
  }
}

/// @nodoc
class _$_CarState implements _CarState {
  _$_CarState(
      {this.carList,
      this.editName,
      this.name,
      this.odo,
      this.image,
      this.isUpdate,
      this.isSaved});

  @override
  final List<Car> carList;
  @override
  final String editName;
  @override
  final String name;
  @override
  final String odo;
  @override
  final File image;
  @override
  final bool isUpdate;
  @override
  final bool isSaved;

  @override
  String toString() {
    return 'CarState(carList: $carList, editName: $editName, name: $name, odo: $odo, image: $image, isUpdate: $isUpdate, isSaved: $isSaved)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CarState &&
            (identical(other.carList, carList) ||
                const DeepCollectionEquality()
                    .equals(other.carList, carList)) &&
            (identical(other.editName, editName) ||
                const DeepCollectionEquality()
                    .equals(other.editName, editName)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.odo, odo) ||
                const DeepCollectionEquality().equals(other.odo, odo)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.isUpdate, isUpdate) ||
                const DeepCollectionEquality()
                    .equals(other.isUpdate, isUpdate)) &&
            (identical(other.isSaved, isSaved) ||
                const DeepCollectionEquality().equals(other.isSaved, isSaved)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(carList) ^
      const DeepCollectionEquality().hash(editName) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(odo) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(isUpdate) ^
      const DeepCollectionEquality().hash(isSaved);

  @JsonKey(ignore: true)
  @override
  _$CarStateCopyWith<_CarState> get copyWith =>
      __$CarStateCopyWithImpl<_CarState>(this, _$identity);
}

abstract class _CarState implements CarState {
  factory _CarState(
      {List<Car> carList,
      String editName,
      String name,
      String odo,
      File image,
      bool isUpdate,
      bool isSaved}) = _$_CarState;

  @override
  List<Car> get carList;
  @override
  String get editName;
  @override
  String get name;
  @override
  String get odo;
  @override
  File get image;
  @override
  bool get isUpdate;
  @override
  bool get isSaved;
  @override
  @JsonKey(ignore: true)
  _$CarStateCopyWith<_CarState> get copyWith;
}
