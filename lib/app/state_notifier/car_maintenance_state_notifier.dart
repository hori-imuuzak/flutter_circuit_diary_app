import 'package:circuit_diary/app/domain/entity/cost.dart';
import 'package:circuit_diary/app/domain/entity/gas.dart';
import 'package:circuit_diary/app/domain/entity/maintenance_item.dart';
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

    state = state.copyWith(carUid: carUid);
  }

  // 整備・修理の新規作成フォーム
  void initRepair() {
    state = state.copyWith(
      editingRepair: Repair(
        maintenanceItemList: [MaintenanceItem()],
      ),
    );
  }

  // 整備・修理の初期設定
  void setRepair(Repair repair) {
    state = state.copyWith(editingRepair: repair, isUpdate: true);
  }

  // 整備・修理の編集
  void editRepair({DateTime doneAt, String odo, String note}) {
    final editingRepair = state.editingRepair;
    var nextOdo = editingRepair?.odo;
    if (odo == "") {
      nextOdo = null;
    } else if (odo != null) {
      nextOdo = int.tryParse(odo) ?? editingRepair?.odo;
    }

    final repair = Repair(
      doneAt: doneAt ?? editingRepair?.doneAt,
      maintenanceItemList: editingRepair?.maintenanceItemList ??
          [
            MaintenanceItem(),
          ],
      odo: nextOdo,
      note: note ?? editingRepair?.note,
    );

    state = state.copyWith(editingRepair: repair);
  }

  // 整備項目の追加
  void addMaintenanceItem() {
    final editingRepair = state.editingRepair;
    if (editingRepair != null) {
      final maintenanceItemList = [
        ...editingRepair.maintenanceItemList,
        MaintenanceItem()
      ];

      final repair = Repair(
        doneAt: editingRepair.doneAt,
        maintenanceItemList: maintenanceItemList,
        odo: editingRepair.odo,
        note: editingRepair.note,
      );

      state = state.copyWith(editingRepair: repair);
    }
  }

  // 整備項目の削除
  void removeMaintenanceItem(int index) {
    final editingRepair = state.editingRepair;
    if (editingRepair != null) {
      editingRepair.maintenanceItemList.removeAt(index);
      final maintenanceItemList = [...editingRepair.maintenanceItemList];

      final repair = Repair(
        doneAt: editingRepair.doneAt,
        maintenanceItemList: maintenanceItemList,
        odo: editingRepair.odo,
        note: editingRepair.note,
      );

      state = state.copyWith(editingRepair: repair);
    }
  }

  // 整備項目の編集
  void editMaintenanceItem({int index, String name, String price}) {
    final editingRepair = state.editingRepair;
    if (editingRepair != null) {
      final maintenanceItem = editingRepair.maintenanceItemList[index];
      var nextPrice = maintenanceItem.price;
      if (price == "" || price == null) {
        nextPrice = null;
      } else {
        nextPrice = int.tryParse(price) ?? maintenanceItem.price;
      }
      editingRepair.maintenanceItemList[index] = MaintenanceItem(
        name: name ?? maintenanceItem.name,
        price: nextPrice,
      );

      final repair = Repair(
        doneAt: editingRepair.doneAt,
        maintenanceItemList: editingRepair.maintenanceItemList,
        odo: editingRepair.odo,
        note: editingRepair.note,
      );

      state = state.copyWith(editingRepair: repair);
    }
  }

  // 整備項目の保存
  Future<void> saveRepair() async {
    if (state.editingRepair != null) {
      await _maintenanceRepository.create(state.carUid, state.editingRepair);
    }
    state = state.copyWith(isSaved: true);
  }


  // ガソリンの初期設定
  void setGas(Gas gas) {
    state = state.copyWith(editingGas: gas, isUpdate: true);
  }

  // ガソリンの編集
  void editGas({DateTime doneAt, String liter, String price}) {
    final editingGas = state.editingGas;

    var nextLiter = editingGas?.liter;
    if (liter == "") {
      nextLiter = null;
    } else if (liter != null) {
      nextLiter = double.tryParse(liter) ?? editingGas?.liter;
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
    if (state.editingGas != null) {
      await _maintenanceRepository.create(state.carUid, state.editingGas);
    }
    state = state.copyWith(isSaved: true);
  }

  // 経費の初期設定
  void setCost(Cost cost) {
    state = state.copyWith(editingCost: cost, isUpdate: true);
  }

  // 経費の編集
  void editCost({DateTime doneAt, String name, String price}) {
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
    if (state.editingCost != null) {
      await _maintenanceRepository.create(state.carUid, state.editingCost);
    }
    state = state.copyWith(isSaved: true);
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
