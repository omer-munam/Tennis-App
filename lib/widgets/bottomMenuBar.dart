import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_event/Models/court.dart';
import 'package:tennis_event/Models/game.dart';
import 'package:tennis_event/Models/user.dart';
import 'package:tennis_event/screens/game/joinGame.dart';
import 'package:tennis_event/screens/game/newGame.dart';
import 'package:tennis_event/screens/user/userGames.dart';
import 'package:tennis_event/screens/user/userRanking.dart';
import 'package:tennis_event/services/database.dart';
import 'package:tennis_event/utilities/constants.dart';

class BottomMenuBar extends StatefulWidget {
  @override
  _BottomMenuBarState createState() => _BottomMenuBarState();
}

class _BottomMenuBarState extends State<BottomMenuBar> {
  int _currentIndex = 0;
  static DatabaseService _db = DatabaseService();

  final List<Widget> _children = [
    JoinGame(),
    MyGames(),
    StreamProvider<List<Court>>.value(
      value: _db.courts,
      child: NewGames(),
    ),
    StreamProvider<List<User>>.value(
      value: _db.users,
      child: UserRanking(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        selectedLabelStyle: TextStyle(fontFamily: 'Roboto'),
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
              scale: 15,
              fit: BoxFit.scaleDown,
            ),
            title: Text('Games'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/gameInvite.png',
              scale: 25,
              fit: BoxFit.scaleDown,
            ),
            title: Text('Invite'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Ranking'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Chat'),
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
