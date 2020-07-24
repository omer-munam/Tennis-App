import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tennis_event/utilities/boxes.dart';
import 'package:tennis_event/utilities/constants.dart';
import 'package:tennis_event/utilities/styles.dart';

class GameDetails extends StatefulWidget {
  static const String id = 'game_details_screen';
  @override
  _GameDetailsState createState() => _GameDetailsState();
}

class _GameDetailsState extends State<GameDetails> {
  @override
  Widget build(BuildContext context) {
    var _selectedIndex = 2;
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(
                      'assets/images/slider_image.png',
                      width: double.infinity,
                      height: 200.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.timer),
                        SizedBox(width: 5.0),
                        Text('Date/Time'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: 5.0),
                        Text('Location'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.alarm),
                        SizedBox(width: 5.0),
                        Text('Tournament: '),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.check_box),
                        SizedBox(width: 5.0),
                        Text('Booked'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.developer_board),
                          SizedBox(width: 5.0),
                          Text('Notes'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 10,
                          left: 8,
                        ),
                        child: Text(
                            'This is a text box. This is a text box. This is a text box. '),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          DividerLine(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('06'),
                    Text('Joined'),
                  ],
                ),
                Column(
                  children: [
                    Text('200'),
                    Text('Capacity'),
                  ],
                ),
                Column(
                  children: [
                    Text('06'),
                    Text('No. of Players'),
                  ],
                ),
                Column(
                  children: [
                    Text('25'),
                    Text('No. of Seats'),
                  ],
                ),
              ],
            ),
          ),
          DividerLine(),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
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
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.timer,
                                        size: 25,
                                      ),
                                      SizedBox(width: 5.0),
                                      Text(
                                        'Host Name',
                                      ),
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
                Expanded(
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  size: 30,
                                ),
                                SizedBox(width: 5.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Player Name',
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Player Point',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
