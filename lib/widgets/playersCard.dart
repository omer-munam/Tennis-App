import 'package:flutter/material.dart';
import 'package:tennis_event/utilities/styles.dart';

class PlayersCard extends StatelessWidget {
//  PlayersCard({this.listTile, this.location, this.name, this.data, this.icon});
//
//  final Widget listTile;
//  final String name;
//  final String location;
//  final String data;
//  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey[500],
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: const ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  'assets/images/playerImage.png',
                ),
              ),
              title: Text(
                'Player Name',
                style: kCardHeading,
              ),
              subtitle: Text(
                'Location',
                style: kCardSubtitle,
              ),
              dense: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              top: 8.0,
              bottom: 8.0,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    'assets/icons/ballIcon.png',
                  ),
                  backgroundColor: Colors.transparent,
                  radius: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25.0,
                  ),
                  child: Text(
                    'Player\'s Game Data',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
