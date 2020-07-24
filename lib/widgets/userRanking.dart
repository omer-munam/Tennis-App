import 'package:flutter/material.dart';
import 'package:tennis_event/utilities/constants.dart';

class UserRankingWidget extends StatefulWidget {
  const UserRankingWidget({
    Key key,
  }) : super(key: key);

  @override
  _UserRankingWidgetState createState() => _UserRankingWidgetState();
}

class _UserRankingWidgetState extends State<UserRankingWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage(
                  'assets/images/playerImage.png',
                ),
              ),
              Text(
                'Ranks',
              ),
            ],
          ),
          SizedBox(
            width: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Text(
                  'Player\'s Name',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    color: kDividerLineGray,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      child: Image.asset(
                        'assets/icons/ball_icon.png',
                      ),
                      backgroundColor: Colors.transparent,
                      radius: 10,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '250 Points',
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
