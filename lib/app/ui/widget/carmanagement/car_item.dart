import 'package:flutter/material.dart';

class CarItem extends StatelessWidget {

  CarItem({ this.name, this.odo, this.imageUrl });

  final String name;
  final String odo;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    // 一旦固定で名前/走行距離を出す
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          FadeInImage(
            image: NetworkImage(this.imageUrl),
            placeholder: AssetImage("images/car_default.png"),
            width: 64.0,
            height: 64.0,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(this.name),
              Text(this.odo)
            ],
          )
        ],
      )
    );
  }
}