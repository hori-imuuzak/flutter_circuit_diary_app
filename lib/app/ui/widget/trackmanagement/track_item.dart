import 'package:flutter/material.dart';

class TrackItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // 一旦固定で名前/住所を出す
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.network("https://lh3.googleusercontent.com/proxy/Jrlu2Mn7DyaQxQo0GUVrTbQZNbHm_PyMyECU20tHcTfcuz0ijsAh9NVcdxdGChV-vuODaGma7ZNdF9j6-EBW6MkqDWC4Gf-BTydvBhrscg", width: double.infinity, height: 120.0),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("富士スピードウェイ"),
              Text("静岡県小山町")
            ],
          )
        ],
      )
    );
  }
}