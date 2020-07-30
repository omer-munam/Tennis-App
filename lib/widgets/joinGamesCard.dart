import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tennis_event/Models/court.dart';
import 'package:tennis_event/Models/user.dart';
import 'package:tennis_event/Models/game.dart';
import 'package:tennis_event/screens/game/gameDetail.dart';
import 'package:tennis_event/services/database.dart';
import 'package:tennis_event/utilities/loader.dart';
import 'package:tennis_event/widgets/BottomSecondMenubar.dart';
import 'package:tennis_event/utilities/constants.dart';

class JoinGameCard extends StatelessWidget {
  Game game;
  JoinGameCard(this.game);
  bool loading = false;
  Court court;
  DatabaseService _db;
  User organizer;

  @override
  Widget build(BuildContext context) {
    court = Provider.of<Court>(context);
    organizer = Provider.of<User>(context);

    if (court == null && organizer == null) {
      loading = true;
    } else {
      loading = false;
    }

    return loading
        ? Container()
        : Container(
            child: GestureDetector(
              onTap: () {
                if (!game.tournament) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameDetails(
                        game,
                        court: court,
                        join: true,
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
              child: Container(
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                Image.asset('assets/images/slider_image.png'),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                game.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.timer),
                                  SizedBox(width: 5.0),
                                  Text(
                                    DateFormat.yMMMMd('en_US').add_jm().format(
                                          game.time.toDate(),
                                        ),
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.location_on),
                                  SizedBox(width: 5.0),
                                  Text(
                                    court.courtname + ', ' + court.country,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    child: Text(
                                      '10',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                    backgroundImage: AssetImage(
                                      'assets/images/ball_image.png',
                                    ),
                                    backgroundColor: Colors.transparent,
                                    radius: 10,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(game.type),
                                ],
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                      'assets/images/samClub.png',
                                    ),
                                    backgroundColor: Colors.transparent,
                                    radius: 10,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(organizer.userName),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                      child: Divider(
                        color: kMainThemeColor,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 10,
                                      child: Icon(
                                        Icons.face,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: CircleAvatar(
                                        radius: 10,
                                        child: Icon(
                                          Icons.face,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: CircleAvatar(
                                        radius: 10,
                                        child: Icon(
                                          Icons.face,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  '${game.players.length}/${game.slots.toString()} Joined',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Icon(Icons.favorite),
                                SizedBox(width: 5.0),
                                Text('150'),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Icon(Icons.share),
                                SizedBox(width: 5.0),
                                Text('250'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                      child: Divider(
                        color: kMainThemeColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
