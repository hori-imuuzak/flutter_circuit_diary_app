import 'dart:io';

import 'package:circuit_diary/app/ui/style.dart';
import 'package:flutter/material.dart';

class TrackItem extends StatelessWidget {
  TrackItem({
    this.imageUrl,
    this.name,
    this.address,
    this.onTap,
  });

  final String imageUrl;
  final String name;
  final String address;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    // 一旦固定で名前/住所を出す
    return InkWell(
        onTap: this.onTap,
        child: Padding(
            padding: EdgeInsets.all(Space.XS),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                this.imageUrl != ""
                    ? Image.file(File(this.imageUrl),
                        width: double.infinity, height: 120.0)
                    : Image.asset("images/track_default.png",
                        width: double.infinity, height: 120.0),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(this.name), Text(this.address)],
                )
              ],
            )));
  }
}
