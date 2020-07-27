import 'package:flutter/material.dart';
import 'package:tennis_event/screens/filter.dart';
import 'package:tennis_event/screens/game/courtSchedule.dart';
import 'package:tennis_event/screens/game/createTennisCourt.dart';
import 'package:tennis_event/screens/game/frenchOpenDraw.dart';
import 'package:tennis_event/screens/game/gameDetail.dart';
import 'package:tennis_event/screens/game/joinGame.dart';
import 'package:tennis_event/screens/game/newGame.dart';
import 'package:tennis_event/screens/game/tennisCourt.dart';
import 'package:tennis_event/screens/mainScreen.dart';
import 'package:tennis_event/screens/user/players.dart';
import 'package:tennis_event/screens/user/registerScreen.dart';
import 'package:tennis_event/screens/user/userGames.dart';
import 'package:tennis_event/screens/user/userRanking.dart';
import 'package:tennis_event/utilities/constants.dart';
import 'package:tennis_event/utilities/styles.dart';

// ignore: must_be_immutable
class AllScreens extends StatelessWidget {
  static const String id = 'all_screens';
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kMainThemeColor,
        centerTitle: true,
        title: Text(
          'LayOut Screens',
          style: kAppbarStyle,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    child: Text("Chat Home"),
                    elevation: 5.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => null,
                        ),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text("Main"),
                    elevation: 5.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text("Players"),
                    elevation: 5.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Players(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    child: Text("Register"),
                    elevation: 5.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text("MyGames"),
                    elevation: 5.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyGames(),
                        ),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text("User Profile"),
                    elevation: 5.0,
                    onPressed: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => UserProfile(),
//                        ),
//                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    child: Text('Ranking'),
                    elevation: 5.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserRanking(),
                        ),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text("Court Schedule"),
                    elevation: 5.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CourtSchedule(),
                        ),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text("New Court"),
                    elevation: 5.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewTennisCourt(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    child: Text('French Open'),
                    elevation: 5.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TournamentDrawgame(),
                        ),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text("Game Detail"),
                    elevation: 5.0,
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => GameDetails(),
                      //   ),
                      // );
                    },
                  ),
                  RaisedButton(
                    child: Text("Join Game"),
                    elevation: 5.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JoinGame(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    child: Text('New Games'),
                    elevation: 5.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewGames(),
                        ),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text("Tennis Court"),
                    elevation: 5.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TennisCourt(),
                        ),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text("Filter"),
                    elevation: 5.0,
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) =>
                              FilterScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
