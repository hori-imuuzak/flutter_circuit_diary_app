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

  // 経費の初期設定
  void setCost(Cost cost) {
    state = state.copyWith(editingCost: cost, isUpdate: true);
  }
  // 経費の編集
  void editCost({ DateTime doneAt, String name, String price }) {
    var cost = Cost(
      doneAt: doneAt ?? state.editingCost?.doneAt,
      name: name ?? state.editingCost?.name,
      price: int.tryParse(price) ?? state.editingCost?.price,
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
