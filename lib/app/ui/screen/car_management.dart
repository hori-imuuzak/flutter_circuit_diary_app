import 'package:circuit_diary/app/ui/widget/carmanagement/car_tablist.dart';
import 'package:circuit_diary/app/ui/widget/carmanagement/edit_car.dart';
import 'package:flutter/material.dart';
import 'package:circuit_diary/app/ui/widget/transition.dart';
import 'package:circuit_diary/app/ui/widget/carmanagement/car_list.dart';

class CarManagement extends StatelessWidget {
  final _transition = Transition();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarList(onTapItem: () {
        Navigator.of(context).push(_toCarTabList(_transition));
      }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(_toCreateCar(_transition));
          },
          child: Icon(Icons.add)),
    );
  }
}

Route _toCreateCar(Transition transition) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => EditCar(hasAppBar: true),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return transition.getTransition(animation, child);
      });
}

Route _toCarTabList(Transition transition) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => CarTabList(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return transition.getTransition(animation, child);
      });
}
