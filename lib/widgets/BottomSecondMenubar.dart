import 'package:flutter/material.dart';
import 'package:tennis_event/screens/game/newGame.dart';
import 'package:tennis_event/screens/user/userGames.dart';
import 'package:tennis_event/screens/user/userRanking.dart';
import 'package:tennis_event/utilities/constants.dart';

class BottomSecondMbar extends StatefulWidget {
  @override
  _BottomSecondMbarState createState() => _BottomSecondMbarState();
}

class _BottomSecondMbarState extends State<BottomSecondMbar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MyGames(),
    NewGames(),
    UserRanking(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 25,
        currentIndex: _currentIndex,
        // this will be set when a new tab is tapped
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/icons/greenBall.png',
              scale: 2.6,
              fit: BoxFit.scaleDown,
            ),
            icon: Image.asset(
              'assets/icons/ball_icon.png',
              scale: 10,
              fit: BoxFit.scaleDown,
            ),
            title: Text('Join Game'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/game_icon.png',
              scale: 10,
              fit: BoxFit.scaleDown,
            ),
            title: Text('Games'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_add),
            title: Text('Invite'),
          ),
        ],
        elevation: 25,
        selectedItemColor: kMainThemeColor,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
      ),
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
