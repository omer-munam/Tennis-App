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

  @override
  Widget build(BuildContext context) {
    List<Game> myGames = Provider.of<List<Game>>(context);
    if (myGames == null) {
      loading = true;
    } else {
      loading = false;
    }

    return loading
        ? Loading()
        : Scaffold(
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
                  _db = DatabaseService(courtId: myGames[index].courtId);
                  return StreamProvider<Court>.value(
                    value: _db.court,
                    child: UserGamesCard(myGames[index]),
                  );
                },
              ),
            ),
          );
  }
}
