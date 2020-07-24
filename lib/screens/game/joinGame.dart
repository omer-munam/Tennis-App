import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tennis_event/screens/filter.dart';
import 'package:tennis_event/utilities/constants.dart';

class JoinGame extends StatefulWidget {
  static const String id = 'join_game_screen';
  @override
  _JoinGameState createState() => _JoinGameState();
}

class _JoinGameState extends State<JoinGame> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              color: kMainThemeColor,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SearchBar(
                        searchBarStyle: SearchBarStyle(
                          backgroundColor: Colors.white30,
                          padding: EdgeInsets.all(10),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        hintText: 'Search Here..',
                        icon: Icon(Icons.search),
                        iconActiveColor: Colors.white,
                        onItemFound: null,
                        onSearch: null,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/images/slider_image.png'),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Game Title',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.timer),
                                SizedBox(width: 5.0),
                                Text('Game Timing'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                SizedBox(width: 5.0),
                                Text('Game Location'),
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
                                Text('Game Type'),
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
                                Text('Organizer'),
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
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                              Text('6/6 Joined'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        'The Game is yet to be created by the user and the basic game layout should be like the above tile.',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
