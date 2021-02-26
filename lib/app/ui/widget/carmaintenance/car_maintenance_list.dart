import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CarMaintenanceList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("メンテなんちゅ"),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0, color: Colors.white),
        backgroundColor: Colors.blue,
        curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
            child: Icon(Icons.create),
            backgroundColor: Colors.yellow,
            label: "整備・修理",
            onTap: () {},
          ),
          SpeedDialChild(
            child: Icon(Icons.create),
            backgroundColor: Colors.green,
            label: "ガソリン",
            onTap: () {},
          ),
          SpeedDialChild(
            child: Icon(Icons.create),
            backgroundColor: Colors.red,
            label: "経費",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}