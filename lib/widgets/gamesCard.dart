import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tennis_event/Models/court.dart';
import 'package:tennis_event/Models/game.dart';
import 'package:tennis_event/Models/user.dart';
import 'package:tennis_event/screens/game/gameDetail.dart';
import 'package:tennis_event/services/database.dart';
import 'package:tennis_event/utilities/styles.dart';
import 'package:tennis_event/widgets/BottomSecondMenubar.dart';

class UserGamesCard extends StatelessWidget {
  Game game;

  UserGamesCard(this.game);

  bool loading = false;
  Court court;
  DatabaseService _db;
  List<User> players;

  @override
  Widget build(BuildContext context) {
    court = Provider.of<Court>(context);

    if (court == null) {
      loading = true;
    } else {
      loading = false;
    }

    if (loading) {
      return Container();
    } else {
      if (game.players.isEmpty) {
        // print('players: ${game.players}');
        return gameCard(context);
      } else {
        print('players: ${game.players}');
        _db = DatabaseService(playerIds: game.players);
        return StreamBuilder(
          stream: _db.usersDataForGame,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              players = snapshot.data;
              print('players: ${players.length}');
              return gameCard(context);
            } else {
              return Container();
            }
          },
        );
      }
    }
  }

  Widget gameCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!game.tournament) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GameDetails(
                game,
                court: court,
                join: false,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BottomSecondMbar(),
            ),
          );
        }
      },
      child: Card(
        elevation: 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: ImageIcon(
                AssetImage(
                  'assets/icons/racket_icon.png',
                ),
                size: 30,
              ),
              title: Row(
                children: <Widget>[
                  Text(
                    'Participants: ',
                    style: kCardSubtitle,
                  ),
                  if (players != null)
                    for (var player in players)
                      Text(
                        player.userName + ' ',
                        style: kCardSubHeading,
                        overflow: TextOverflow.ellipsis,
                      )
                  else
                    Text(
                      '-',
                      style: kCardSubHeading,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
              dense: true,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25.0,
                top: 8.0,
                bottom: 8.0,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Image.asset(
                          'assets/icons/clock_icon.png',
                        ),
                        backgroundColor: Colors.transparent,
                        radius: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25.0,
                        ),
                        child: Text(
                          DateFormat.yMMMMd('en_US')
                              .add_jm()
                              .format(game.time.toDate()),
                          style: kCardSubtitle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Image.asset(
                          'assets/icons/ballBlackIcon.png',
                        ),
                        backgroundColor: Colors.transparent,
                        radius: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25.0,
                        ),
                        child: Text(
                          court.courtname +
                              ', ' +
                              court.city +
                              ', ' +
                              court.country,
                          style: kCardSubtitle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
