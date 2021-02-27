// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'car_maintenance_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CarMaintenanceStateTearOff {
  const _$CarMaintenanceStateTearOff();

// ignore: unused_element
  _CarMaintenanceState call(
      {String carUid,
      List<CarMaintenance> maintenanceList,
      Repair editingRepair,
      Gas editingGas,
      Cost editingCost,
      bool isUpdate,
      bool isSaved}) {
    return _CarMaintenanceState(
      carUid: carUid,
      maintenanceList: maintenanceList,
      editingRepair: editingRepair,
      editingGas: editingGas,
      editingCost: editingCost,
      isUpdate: isUpdate,
      isSaved: isSaved,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $CarMaintenanceState = _$CarMaintenanceStateTearOff();

/// @nodoc
mixin _$CarMaintenanceState {
  String get carUid;
  List<CarMaintenance> get maintenanceList;
  Repair get editingRepair;
  Gas get editingGas;
  Cost get editingCost;
  bool get isUpdate;
  bool get isSaved;

  @JsonKey(ignore: true)
  $CarMaintenanceStateCopyWith<CarMaintenanceState> get copyWith;
}

/// @nodoc
abstract class $CarMaintenanceStateCopyWith<$Res> {
  factory $CarMaintenanceStateCopyWith(
          CarMaintenanceState value, $Res Function(CarMaintenanceState) then) =
      _$CarMaintenanceStateCopyWithImpl<$Res>;
  $Res call(
      {String carUid,
      List<CarMaintenance> maintenanceList,
      Repair editingRepair,
      Gas editingGas,
      Cost editingCost,
      bool isUpdate,
      bool isSaved});
}

/// @nodoc
class _$CarMaintenanceStateCopyWithImpl<$Res>
    implements $CarMaintenanceStateCopyWith<$Res> {
  _$CarMaintenanceStateCopyWithImpl(this._value, this._then);

  final CarMaintenanceState _value;
  // ignore: unused_field
  final $Res Function(CarMaintenanceState) _then;

  @override
  $Res call({
    Object carUid = freezed,
    Object maintenanceList = freezed,
    Object editingRepair = freezed,
    Object editingGas = freezed,
    Object editingCost = freezed,
    Object isUpdate = freezed,
    Object isSaved = freezed,
  }) {
    return _then(_value.copyWith(
      carUid: carUid == freezed ? _value.carUid : carUid as String,
      maintenanceList: maintenanceList == freezed
          ? _value.maintenanceList
          : maintenanceList as List<CarMaintenance>,
      editingRepair: editingRepair == freezed
          ? _value.editingRepair
          : editingRepair as Repair,
      editingGas: editingGas == freezed ? _value.editingGas : editingGas as Gas,
      editingCost:
          editingCost == freezed ? _value.editingCost : editingCost as Cost,
      isUpdate: isUpdate == freezed ? _value.isUpdate : isUpdate as bool,
      isSaved: isSaved == freezed ? _value.isSaved : isSaved as bool,
    ));
  }
}

/// @nodoc
abstract class _$CarMaintenanceStateCopyWith<$Res>
    implements $CarMaintenanceStateCopyWith<$Res> {
  factory _$CarMaintenanceStateCopyWith(_CarMaintenanceState value,
          $Res Function(_CarMaintenanceState) then) =
      __$CarMaintenanceStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String carUid,
      List<CarMaintenance> maintenanceList,
      Repair editingRepair,
      Gas editingGas,
      Cost editingCost,
      bool isUpdate,
      bool isSaved});
}

/// @nodoc
class __$CarMaintenanceStateCopyWithImpl<$Res>
    extends _$CarMaintenanceStateCopyWithImpl<$Res>
    implements _$CarMaintenanceStateCopyWith<$Res> {
  __$CarMaintenanceStateCopyWithImpl(
      _CarMaintenanceState _value, $Res Function(_CarMaintenanceState) _then)
      : super(_value, (v) => _then(v as _CarMaintenanceState));

  @override
  _CarMaintenanceState get _value => super._value as _CarMaintenanceState;

  @override
  $Res call({
    Object carUid = freezed,
    Object maintenanceList = freezed,
    Object editingRepair = freezed,
    Object editingGas = freezed,
    Object editingCost = freezed,
    Object isUpdate = freezed,
    Object isSaved = freezed,
  }) {
    return _then(_CarMaintenanceState(
      carUid: carUid == freezed ? _value.carUid : carUid as String,
      maintenanceList: maintenanceList == freezed
          ? _value.maintenanceList
          : maintenanceList as List<CarMaintenance>,
      editingRepair: editingRepair == freezed
          ? _value.editingRepair
          : editingRepair as Repair,
      editingGas: editingGas == freezed ? _value.editingGas : editingGas as Gas,
      editingCost:
          editingCost == freezed ? _value.editingCost : editingCost as Cost,
      isUpdate: isUpdate == freezed ? _value.isUpdate : isUpdate as bool,
      isSaved: isSaved == freezed ? _value.isSaved : isSaved as bool,
    ));
  }
}

/// @nodoc
class _$_CarMaintenanceState implements _CarMaintenanceState {
  _$_CarMaintenanceState(
      {this.carUid,
      this.maintenanceList,
      this.editingRepair,
      this.editingGas,
      this.editingCost,
      this.isUpdate,
      this.isSaved});

  @override
  final String carUid;
  @override
  final List<CarMaintenance> maintenanceList;
  @override
  final Repair editingRepair;
  @override
  final Gas editingGas;
  @override
  final Cost editingCost;
  @override
  final bool isUpdate;
  @override
  final bool isSaved;

  @override
  String toString() {
    return 'CarMaintenanceState(carUid: $carUid, maintenanceList: $maintenanceList, editingRepair: $editingRepair, editingGas: $editingGas, editingCost: $editingCost, isUpdate: $isUpdate, isSaved: $isSaved)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CarMaintenanceState &&
            (identical(other.carUid, carUid) ||
                const DeepCollectionEquality().equals(other.carUid, carUid)) &&
            (identical(other.maintenanceList, maintenanceList) ||
                const DeepCollectionEquality()
                    .equals(other.maintenanceList, maintenanceList)) &&
            (identical(other.editingRepair, editingRepair) ||
                const DeepCollectionEquality()
                    .equals(other.editingRepair, editingRepair)) &&
            (identical(other.editingGas, editingGas) ||
                const DeepCollectionEquality()
                    .equals(other.editingGas, editingGas)) &&
            (identical(other.editingCost, editingCost) ||
                const DeepCollectionEquality()
                    .equals(other.editingCost, editingCost)) &&
            (identical(other.isUpdate, isUpdate) ||
                const DeepCollectionEquality()
                    .equals(other.isUpdate, isUpdate)) &&
            (identical(other.isSaved, isSaved) ||
                const DeepCollectionEquality().equals(other.isSaved, isSaved)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(carUid) ^
      const DeepCollectionEquality().hash(maintenanceList) ^
      const DeepCollectionEquality().hash(editingRepair) ^
      const DeepCollectionEquality().hash(editingGas) ^
      const DeepCollectionEquality().hash(editingCost) ^
      const DeepCollectionEquality().hash(isUpdate) ^
      const DeepCollectionEquality().hash(isSaved);

  @JsonKey(ignore: true)
  @override
  _$CarMaintenanceStateCopyWith<_CarMaintenanceState> get copyWith =>
      __$CarMaintenanceStateCopyWithImpl<_CarMaintenanceState>(
          this, _$identity);
}

abstract class _CarMaintenanceState implements CarMaintenanceState {
  factory _CarMaintenanceState(
      {String carUid,
      List<CarMaintenance> maintenanceList,
      Repair editingRepair,
      Gas editingGas,
      Cost editingCost,
      bool isUpdate,
      bool isSaved}) = _$_CarMaintenanceState;

  @override
  String get carUid;
  @override
  List<CarMaintenance> get maintenanceList;
  @override
  Repair get editingRepair;
  @override
  Gas get editingGas;
  @override
  Cost get editingCost;
  @override
  bool get isUpdate;
  @override
  bool get isSaved;
  @override
  @JsonKey(ignore: true)
  _$CarMaintenanceStateCopyWith<_CarMaintenanceState> get copyWith;
}
