import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_event/Models/court.dart';
import 'package:tennis_event/Models/game.dart';
import 'package:tennis_event/Widgets/gamesCard.dart';
import 'package:tennis_event/services/database.dart';
import 'package:tennis_event/utilities/constants.dart';
import 'package:tennis_event/utilities/loader.dart';
import 'package:tennis_event/utilities/styles.dart';

class MyGames extends StatefulWidget {
  static const String id = 'mygames_screen';
  @override
  _MyGamesState createState() => _MyGamesState();
}

class _MyGamesState extends State<MyGames> {
  int _selectedIndex = 1;
  bool loading = false;
  DatabaseService _db = DatabaseService();
  List<Game> myGames;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser currentUser;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : FutureBuilder(
            future: _db.getCurrentUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _db = DatabaseService(userId: snapshot.data.uid);
                return StreamBuilder(
                  stream: _db.userGames,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      myGames = snapshot.data;
                      if (myGames.isNotEmpty) {
                        return Scaffold(
                          resizeToAvoidBottomInset: false,
                          appBar: AppBar(
                            backgroundColor: kMainThemeColor,
                            centerTitle: true,
                            title: Text(
                              'My Games',
                              style: kAppbarStyle,
                            ),
                          ),
                          body: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              itemCount: myGames.length,
                              itemBuilder: (context, index) {
                                _db = DatabaseService(
                                    courtId: myGames[index].courtId);
                                return StreamProvider<Court>.value(
                                  value: _db.court,
                                  child: UserGamesCard(myGames[index]),
                                );
                              },
                            ),
                          ),
                        );
                      } else {
                        return Scaffold(
                          resizeToAvoidBottomInset: false,
                          appBar: AppBar(
                            backgroundColor: kMainThemeColor,
                            centerTitle: true,
                            title: Text(
                              'My Games',
                              style: kAppbarStyle,
                            ),
                          ),
                          body: Center(
                            child: Text(
                              'You haven\'t created any games yet...',
                            ),
                          ),
                        );
                      }
                    } else {
                      return Loading();
                    }
                  },
                );
              } else {
                return Loading();
              }
            },
          );
  }
}
