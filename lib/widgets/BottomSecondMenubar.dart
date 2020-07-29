import 'package:flutter/material.dart';
import 'package:tennis_event/screens/game/joinGame.dart';
import 'package:tennis_event/screens/game/frenchOpenDraw.dart';
import 'package:tennis_event/screens/user/userRanking.dart';
import 'package:tennis_event/utilities/constants.dart';
import 'package:tennis_event/widgets/playersCard.dart';

class BottomSecondMbar extends StatefulWidget {
  @override
  _BottomSecondMbarState createState() => _BottomSecondMbarState();
}

class _BottomSecondMbarState extends State<BottomSecondMbar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    TournamentDrawgame(),
    Results(),
    PlayersCard(),
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
            title: Text('Draw'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/game_icon.png',
              scale: 10,
              fit: BoxFit.scaleDown,
            ),
            title: Text('Results'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_add),
            title: Text('Players'),
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

class Results extends StatelessWidget {
//  PlayersCard({this.listTile, this.location, this.name, this.data, this.icon});
//
//  final Widget listTile;
//  final String name;
//  final String location;
//  final String data;
//  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Results Screen'),
      ),
    );
  }
}
