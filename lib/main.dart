import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tennis_event/screens/filter.dart';
import 'package:tennis_event/screens/game/courtSchedule.dart';
import 'package:tennis_event/screens/game/courtSearches.dart';
import 'package:tennis_event/screens/game/createTennisCourt.dart';
import 'package:tennis_event/screens/game/frenchOpenDraw.dart';
import 'package:tennis_event/screens/game/gameDetail.dart';
import 'package:tennis_event/screens/game/joinGame.dart';
import 'package:tennis_event/screens/game/newGame.dart';
import 'package:tennis_event/screens/game/tennisCourt.dart';
import 'package:tennis_event/screens/mainScreen.dart';
import 'package:tennis_event/screens/settings.dart';
import 'package:tennis_event/screens/user/players.dart';
import 'package:tennis_event/screens/user/registerScreen.dart';
import 'package:tennis_event/screens/user/userGames.dart';
import 'package:tennis_event/screens/user/userProfile.dart';
import 'package:tennis_event/screens/user/userRanking.dart';
import 'package:tennis_event/splashScreen.dart';
import 'package:tennis_event/utilities/constants.dart';

import 'allScreens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        accentColor: kMainThemeColor,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 27.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal),
        ),
      ),
//      home: Splash(),
      initialRoute: Splash.id,
      routes: {
        AllScreens.id: (context) => AllScreens(),
        Splash.id: (context) => Splash(),
        MainScreen.id: (context) => MainScreen(),

        //players screens
        Players.id: (context) => Players(),
        RegisterScreen.id: (context) => RegisterScreen(),
        MyGames.id: (context) => MyGames(),
        UserProfile.id: (context) => UserProfile(),
        UserRanking.id: (context) => UserRanking(),

        //Game Screens
        CourtSchedule.id: (context) => CourtSchedule(),
        RecentCourtSearches.id: (context) => RecentCourtSearches(),
        NewTennisCourt.id: (context) => NewTennisCourt(),
        TournamentDrawgame.id: (context) => TournamentDrawgame(),
        JoinGame.id: (context) => JoinGame(),
        NewGames.id: (context) => NewGames(),
        TennisCourt.id: (context) => TennisCourt(),

        //Chat Screens

        //Other Screens
        FilterScreen.id: (context) => FilterScreen(),
        Settings.id: (context) => Settings(),
      },
    );
  }
}
