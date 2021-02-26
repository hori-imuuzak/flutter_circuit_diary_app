class CarMaintenance {
  CarMaintenance({
    this.name,
    this.odo,
    this.price,
    this.note,
    this.doneAt,
  });

  final String name;
  final int odo;
  final int price;
  final String note;
  final DateTime doneAt;
}