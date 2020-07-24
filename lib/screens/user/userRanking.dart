import 'package:flutter/material.dart';
import 'package:tennis_event/utilities/boxes.dart';
import 'package:tennis_event/utilities/constants.dart';
import 'package:tennis_event/utilities/styles.dart';
import 'package:tennis_event/widgets/userRanking.dart';

class UserRanking extends StatefulWidget {
  static const String id = 'user_ranking_screen';
  @override
  _RankingState createState() => _RankingState();
}

class _RankingState extends State<UserRanking> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 2;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: kMainThemeColor,
        centerTitle: true,
        title: Text(
          'Ranking',
          style: kAppbarStyle,
        ),
      ),
      body: Column(
        children: [
          UserRankingWidget(),
          DividerLine(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      'The Game is yet to be created by the user and the basic game layout should be like the above tile & fetched from DB.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
