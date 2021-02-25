import 'package:flutter/material.dart';
import 'package:circuit_diary/app/ui/widget/transition.dart';
import 'package:circuit_diary/app/ui/widget/carmanagement/car_list.dart';
import 'package:circuit_diary/app/ui/widget/carmanagement/edit_car.dart';

class CarManagement extends StatelessWidget {

  final _transition = Transition();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(_toCreateCar(_transition));
        },
        child: Icon(Icons.add)
      ),
    );
  }
}

Route _toCreateCar(Transition transition) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => EditCar(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return transition.getTransition(animation, child);
    }
  );
}