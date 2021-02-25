import 'package:flutter/material.dart';
import 'package:circuit_diary/app/ui/widget/transition.dart';
import 'package:circuit_diary/app/ui/widget/trackmanagement/track_list.dart';
import 'package:circuit_diary/app/ui/widget/trackmanagement/edit_track.dart';

class TrackManagement extends StatelessWidget {
  
  final _transition = Transition();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TrackList(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(_toCreateTrack(_transition));
          },
          child: Icon(Icons.add)
      ),
    );
  }
}

Route _toCreateTrack(Transition transition) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => EditTrack(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return transition.getTransition(animation, child);
      }
  );
}