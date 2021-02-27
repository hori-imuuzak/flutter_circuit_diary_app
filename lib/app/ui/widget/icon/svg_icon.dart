import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  SvgIcon({ this.assetName, this.size });

  final String assetName;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(assetName,
        color: Colors.white, width: this.size, height: this.size);
  }
}
