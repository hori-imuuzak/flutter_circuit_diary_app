import 'package:circuit_diary/app/state/track_state.dart';
import 'package:circuit_diary/app/state_notifier/track_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'track_item.dart';

class TrackList extends StatelessWidget {
  TrackList({ this.onTapItem });

  final Function onTapItem;

  @override
  Widget build(BuildContext context) {
    final trackStateNotifier =
        Provider.of<TrackStateNotifier>(context, listen: false);
    final trackState = Provider.of<TrackState>(context, listen: true);

    trackStateNotifier.fetchTrackList();

    List<Widget> items = [];
    trackState.trackList.forEach((track) {
      items.add(TrackItem(
        imageUrl: track.imageUrl,
        name: track.name,
        address: track.address,
        onTap: () {
          trackStateNotifier.setEdit(track);
          this.onTapItem();
        },
      ));
    });

    return GridView.count(
      crossAxisCount: 2,
      children: items,
    );
  }
}
