import 'package:firebase_auth/firebase_auth.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tennis_event/Models/court.dart';
import 'package:tennis_event/Models/game.dart';
import 'package:tennis_event/Models/user.dart';
import 'package:tennis_event/screens/filter.dart';
import 'package:tennis_event/services/database.dart';
import 'package:tennis_event/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'package:tennis_event/utilities/loader.dart';
import 'package:tennis_event/Widgets/joinGamesCard.dart';

class JoinGame extends StatefulWidget {
  static const String id = 'join_game_screen';
  @override
  _JoinGameState createState() => _JoinGameState();
}

class _JoinGameState extends State<JoinGame> {
  int _selectedIndex = 0;
  bool loading = false;
  DatabaseService _db = DatabaseService();
  List<Game> games, othersGames;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser currentUser;
  User user;
  Court court;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : FutureBuilder(
            future: _db.getCurrentUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                currentUser = snapshot.data;
                return StreamBuilder(
                  stream: _db.games,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      games = snapshot.data;
                      games.removeWhere(
                        (element) => element.organizerId == currentUser.uid,
                      );
                      return Scaffold(
                        resizeToAvoidBottomInset: false,
                        appBar: PreferredSize(
                          preferredSize: Size.fromHeight(100),
                          child: SafeArea(
                            child: AppBar(
                              backgroundColor: kMainThemeColor,
                              automaticallyImplyLeading:
                                  false, // hides leading widget
                              flexibleSpace: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      height: 100,
                                      padding: const EdgeInsets.all(8.0),
                                      child: SearchBar(
                                        searchBarStyle: SearchBarStyle(
                                          backgroundColor: Colors.white30,
                                          padding: EdgeInsets.all(10),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        hintText: 'Search Here..',
                                        icon: Icon(Icons.search),
                                        iconActiveColor: Colors.white,
                                        onItemFound: null,
                                        onSearch: null,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.filter_list),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => FilterScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        body: Container(
                          child: ListView.builder(
                            itemCount: games.length,
                            itemBuilder: (context, index) {
                              _db = DatabaseService(
                                userId: games[index].organizerId,
                                courtId: games[index].courtId,
                              );
                              return StreamProvider<Court>.value(
                                value: _db.court,
                                child: StreamProvider<User>.value(
                                  value: _db.userData,
                                  child: JoinGameCard(games[index]),
                                ),
                              );
                            },
                          ),
                        ),
                      );
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
