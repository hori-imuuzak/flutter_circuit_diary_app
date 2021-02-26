import 'package:flutter/material.dart';
import 'package:circuit_diary/app/ui/widget/transition.dart';
import 'package:circuit_diary/app/ui/widget/trackmanagement/track_list.dart';
import 'package:circuit_diary/app/ui/widget/trackmanagement/edit_track.dart';

class TrackManagement extends StatelessWidget {
  
  final _transition = Transition();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TrackList(onTapItem: () {
        toEditTrack(context);
      }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            toEditTrack(context);
          },
          child: Icon(Icons.add)
      ),
    );
  }

  void toEditTrack(BuildContext context) {
    Navigator.of(context).push(_toEditTrack(_transition));
  }
}

Route _toEditTrack(Transition transition) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => EditTrack(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return transition.getTransition(animation, child);
      }
  );
}