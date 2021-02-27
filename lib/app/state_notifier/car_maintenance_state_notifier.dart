import 'package:circuit_diary/app/domain/entity/car_maintenance.dart';
import 'package:circuit_diary/app/domain/entity/cost.dart';
import 'package:circuit_diary/app/domain/entity/gas.dart';
import 'package:circuit_diary/app/domain/entity/repair.dart';
import 'package:circuit_diary/app/domain/repository/maintenance_repository.dart';
import 'package:circuit_diary/app/state/car_maintenance_state.dart';
import 'package:state_notifier/state_notifier.dart';

class CarMaintenanceStateNotifier extends StateNotifier<CarMaintenanceState> {
  CarMaintenanceStateNotifier(this._read)
      : super(CarMaintenanceState(
          maintenanceList: [],
          editingRepair: null,
          editingGas: null,
          editingCost: null,
          isUpdate: false,
          isSaved: false,
        ));

  final T Function<T>() _read;

  MaintenanceRepository get _maintenanceRepository =>
      _read<MaintenanceRepository>();

  // 一覧取得
  Future<void> fetchMaintenanceList(String carUid) async {
    var list = await _maintenanceRepository.list(carUid);

    if (list.isNotEmpty) {
      state = state.copyWith(maintenanceList: list);
    }
  }

  // ガソリンの初期設定
  void setGas(Gas gas) {
    state = state.copyWith(editingGas: gas, isUpdate: true);
  }
  // ガソリンの編集
  void editGas({ DateTime doneAt, String liter, String price }) {
    final editingGas = state.editingGas;

    var nextLiter = editingGas?.liter;
    if (liter == "") {
      nextLiter = null;
    } else if (liter != null) {
      nextLiter = int.tryParse(liter) ?? editingGas?.liter;
    }

    var nextPrice = editingGas?.price;
    if (price == "") {
      nextPrice = null;
    } else if (price != null) {
      nextPrice = int.tryParse(price) ?? editingGas?.price;
    }

    final gas = Gas(
      doneAt: doneAt ?? editingGas?.doneAt,
      liter: nextLiter,
      price: nextPrice,
    );

    state = state.copyWith(editingGas: gas);
  }
  // ガソリンの保存
  Future<void> saveGas() async {
    print(state.editingGas.doneAt);
    print(state.editingGas.liter);
    print(state.editingGas.price);
  }

  // 経費の初期設定
  void setCost(Cost cost) {
    state = state.copyWith(editingCost: cost, isUpdate: true);
  }
  // 経費の編集
  void editCost({ DateTime doneAt, String name, String price }) {
    final editingCost = state.editingCost;

    var nextPrice = editingCost?.price;
    if (price == "") {
      nextPrice = null;
    } else if (price != null) {
      nextPrice = int.tryParse(price) ?? editingCost?.price;
    }

    final cost = Cost(
      doneAt: doneAt ?? editingCost?.doneAt,
      name: name ?? editingCost?.name,
      price: nextPrice,
    );

    state = state.copyWith(editingCost: cost);
  }
  // 経費の保存
  Future<void> saveCost() async {
    print(state.editingCost.doneAt);
    print(state.editingCost.name);
    print(state.editingCost.price);
  }

  // 編集終了
  void clear() {
    state = state.copyWith(
      editingRepair: null,
      editingGas: null,
      editingCost: null,
      isUpdate: false,
      isSaved: false,
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
