import 'package:flutter/material.dart';
import 'package:circuit_diary/app/ui/widget/transition.dart';
import 'package:circuit_diary/app/ui/widget/carmanagement/car_list.dart';
import 'package:circuit_diary/app/ui/widget/carmanagement/edit_car.dart';

class CarManagement extends StatelessWidget {
  final _transition = Transition();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarList(onTapItem: () {
        toEditCar(context);
      }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            toEditCar(context);
          },
          child: Icon(Icons.add)),
    );
  }

  void toEditCar(BuildContext context) {
    Navigator.of(context).push(_toEditCar(_transition));
  }
}

Route _toEditCar(Transition transition) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => EditCar(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return transition.getTransition(animation, child);
      });
}
