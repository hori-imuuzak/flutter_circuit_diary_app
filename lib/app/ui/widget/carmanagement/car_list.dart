import 'package:circuit_diary/app/state/car_state.dart';
import 'package:circuit_diary/app/state_notifier/car_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'car_item.dart';

class CarList extends StatelessWidget {

  CarList({ this.onTapItem });

  final Function onTapItem;

  @override
  Widget build(BuildContext context) {
    final carStateNotifier = Provider.of<CarStateNotifier>(context, listen: false);
    final carState = Provider.of<CarState>(context, listen: true);

    carStateNotifier.fetchCarList();

    List<Widget> items = [];
    carState.carList.forEach((car) {
      items.add(CarItem(
        name: car.name,
        odo: "${car.odo}km",
        imageUrl: car.imageUrl,
        onTap: () {
          carStateNotifier.setEdit(car);
          this.onTapItem();
        }
      ));
    });

    return ListView(
      children: items,
    );
  }
}