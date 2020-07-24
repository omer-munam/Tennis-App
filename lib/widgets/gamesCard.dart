import 'package:flutter/material.dart';
import 'package:tennis_event/utilities/styles.dart';

class UserGamesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
//            leading: CircleAvatar(
//              radius: 15,
//              backgroundColor: Colors.transparent,
//              backgroundImage: AssetImage(
//                'assets/icons/racket_icon.png',
//
//              ),
            leading: ImageIcon(
              AssetImage(
                'assets/icons/racket_icon.png',
              ),
              size: 30,
            ),
            title: Text(
              'Participants:',
              style: kCardSubtitle,
            ),
            dense: true,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              top: 8.0,
              bottom: 8.0,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Image.asset(
                        'assets/icons/clock_icon.png',
                      ),
                      backgroundColor: Colors.transparent,
                      radius: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25.0,
                      ),
                      child: Text(
                        'Date/Time',
                        style: kCardSubtitle,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      child: Image.asset(
                        'assets/icons/ballBlackIcon.png',
                      ),
                      backgroundColor: Colors.transparent,
                      radius: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25.0,
                      ),
                      child: Text(
                        'Location',
                        style: kCardSubtitle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
