import 'package:flutter/material.dart';
import 'track_item.dart';

class TrackList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        TrackItem(),
        TrackItem(),
        TrackItem(),
        TrackItem(),
        TrackItem(),
      ],
    );
  }
}