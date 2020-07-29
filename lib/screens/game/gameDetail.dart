import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:tennis_event/Models/court.dart';
import 'package:tennis_event/Models/game.dart';
import 'package:tennis_event/Models/user.dart';
import 'package:tennis_event/services/database.dart';
import 'package:tennis_event/utilities/boxes.dart';
import 'package:tennis_event/utilities/constants.dart';
import 'package:tennis_event/utilities/loader.dart';
import 'package:tennis_event/utilities/styles.dart';

class GameDetails extends StatefulWidget {
  static const String id = 'game_details_screen';
  Game game;
  Court court;

  GameDetails(this.game, {this.court});
  @override
  _GameDetailsState createState() => _GameDetailsState();
}

class _GameDetailsState extends State<GameDetails> {
  DatabaseService _db;
  User organizer;
  List<User> players;

  @override
  Widget build(BuildContext context) {
    var _selectedIndex = 2;
    _db = DatabaseService(
      userId: widget.game.organizerId,
      playerIds: widget.game.players,
      courtId: widget.game.courtId,
    );

    return StreamBuilder(
      stream: _db.userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          organizer = snapshot.data;
          if (widget.game.players.isEmpty) {
            if (widget.court != null) {
              return scaffold();
            } else {
              return StreamBuilder(
                stream: _db.court,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    widget.court = snapshot.data;
                    return scaffold();
                  } else {
                    return Loading();
                  }
                },
              );
            }
          } else {
            return StreamBuilder(
              stream: _db.usersDataForGame,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  players = snapshot.data;
                  if (widget.court != null) {
                    return scaffold();
                  } else {
                    return StreamBuilder(
                      stream: _db.court,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          widget.court = snapshot.data;
                          return scaffold();
                        } else {
                          return Loading();
                        }
                      },
                    );
                  }
                } else {
                  return Loading();
                }
              },
            );
          }
        } else {
          return Loading();
        }
      },
    );
  }

  Widget scaffold() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kMainThemeColor,
        centerTitle: true,
        title: Text(
          'Game Details',
          style: kAppbarStyle,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              'assets/images/slider_image.png',
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.timer),
                        SizedBox(width: 8.0),
                        Text(
                          DateFormat.yMMMMd('en_US').add_jm().format(
                                widget.game.time.toDate(),
                              ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: 8.0),
                        Text(
                          widget.court.courtname +
                              ', ' +
                              widget.court.city +
                              ', ' +
                              widget.court.country,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.alarm),
                        SizedBox(width: 5.0),
                        Row(
                          children: <Widget>[
                            Text('Tournament: '),
                            SizedBox(
                              width: 5.0,
                            ),
                            widget.game.tournament
                                ? Text(
                                    'Yes',
                                    style: kCardSubHeading,
                                  )
                                : Text(
                                    'No',
                                    style: kCardSubHeading,
                                  ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.check_box),
                        SizedBox(width: 5.0),
                        Text('Booked'),
                        SizedBox(
                          width: 5.0,
                        ),
                        widget.game.booked
                            ? Text(
                                'Yes',
                                style: kCardSubHeading,
                              )
                            : Text(
                                'No',
                                style: kCardSubHeading,
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.developer_board),
                          SizedBox(width: 5.0),
                          Text('Notes'),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                        child: Text(
                          widget.game.notes,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          DividerLine(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      widget.game.players.length.toString(),
                      style: kCardHeading,
                    ),
                    Text(
                      'Joined',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '200',
                      style: kCardHeading,
                    ),
                    Text(
                      'Capacity',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '${widget.game.players.length + 1}',
                      style: kCardHeading,
                    ),
                    Text(
                      'No. of Players',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      widget.game.slots.toString(),
                      style: kCardHeading,
                    ),
                    Text(
                      'No. of Slots',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          DividerLine(),
          Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Organized by:',
                                style: kOrganizerGameDetails,
                              ),
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 15),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundImage:
                                            NetworkImage(organizer.image),
                                      ),
                                      SizedBox(width: 20),
                                      Text(organizer.userName,
                                          style: kCardSubHeadingGrey),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.chat,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
                DividerLine(),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Players Name',
                          style: kOrganizerGameDetails,
                        ),
                        if (players != null)
                          for (var player in players)
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          NetworkImage(player.image),
                                    ),
                                    SizedBox(width: 20),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(player.userName,
                                                style: kCardSubHeadingGrey),
                                          ),
                                          Container(
                                            child: Text(
                                                '${player.points} Points',
                                                style: kCardSubHeadingGrey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                        else
                          Container(
                            height: 10,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
