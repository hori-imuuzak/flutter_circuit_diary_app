import 'package:circuit_diary/app/ui/style.dart';
import 'package:flutter/material.dart';

class TrackItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 一旦固定で名前/住所を出す
    return InkWell(
        onTap: () {},
        child: Padding(
            padding: EdgeInsets.all(Space.XS),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.network(
                    "https://www.fsw.tv/driving/howto/image/bnr_index_fun.png",
                    width: double.infinity,
                    height: 120.0),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("富士スピードウェイ"), Text("静岡県小山町")],
                )
              ],
            )));
  }
}
