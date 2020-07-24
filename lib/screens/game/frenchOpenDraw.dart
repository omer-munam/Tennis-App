import 'package:flutter/material.dart';

class TournamentDrawgame extends StatelessWidget {
  static const String id = 'taurnament_draw_game_screen';

  final VoidCallback player2;
  TournamentDrawgame({
    Key key,
    this.player2,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(-18.0, -13.0),
            child:
                // Adobe XD layer: 'top_bat copy 3' (shape)
                Container(
              width: 1161.0,
              height: 250.0,
              decoration: BoxDecoration(
                color: const Color(0xff6bb801),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x7d000000),
                    offset: Offset(0.2092694193124771, 2.992692232131958),
                    blurRadius: 13,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(427.43, 170.31),
            child: Text(
              'French Open Draw',
              style: TextStyle(
                fontFamily: 'Roboto-Regular',
                fontSize: 48.184959411621094,
                color: const Color(0xffffffff),
                height: 0.5475872504373626,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(69.0, 153.0),
            child:
                // Adobe XD layer: 'back copy 5' (shape)
                Container(
              width: 29.0,
              height: 53.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 2257.0),
            child:
                // Adobe XD layer: 'menu_bg copy 4' (shape)
                Container(
              width: 1129.0,
              height: 178.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x69000000),
                    offset: Offset(0, 0),
                    blurRadius: 18,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(96.07, 2363.02),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Roboto-Regular',
                  fontSize: 32,
                  color: const Color(0xff7e7e7e),
                  height: 0.8125,
                ),
                children: [
                  TextSpan(
                    text: 'My Games ',
                  ),
                  TextSpan(
                    text: ' ',
                    style: TextStyle(
                      color: const Color(0xff9aa03c),
                    ),
                  ),
                  TextSpan(
                    text: '                                   ',
                    style: TextStyle(
                      color: const Color(0xff090909),
                    ),
                  ),
                  TextSpan(
                    text: 'Draw  ',
                    style: TextStyle(
                      color: const Color(0xff73c700),
                    ),
                  ),
                  TextSpan(
                    text: '                                      Results',
                    style: TextStyle(
                      color: const Color(0xff090909),
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(955.0, 2284.0),
            child:
                // Adobe XD layer: '5212-Inflation-Graph' (shape)
                Container(
              width: 76.0,
              height: 66.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(548.0, 2282.0),
            child:
                // Adobe XD layer: 'draw copy' (shape)
                Container(
              width: 68.0,
              height: 68.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(143.0, 2284.0),
            child:
                // Adobe XD layer: 'tenn_bl copy' (shape)
                Container(
              width: 66.0,
              height: 66.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(-1225.0, 0.0),
            child:
                // Adobe XD layer: 'Card 2' (group)
                Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(1252.0, 893.0),
                  child:
                      // Adobe XD layer: 'card1' (shape)
                      Container(
                    width: 1075.0,
                    height: 574.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x47000000),
                          offset: Offset(0, 0),
                          blurRadius: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(1649.0, 939.0),
                  child:
                      // Adobe XD layer: 'back copy 6' (shape)
                      Container(
                    width: 14.0,
                    height: 28.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(''),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(1932.0, 939.0),
                  child:
                      // Adobe XD layer: 'back copy 7' (shape)
                      Container(
                    width: 14.0,
                    height: 28.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(''),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(1438.34, 1239.26),
                  child: Text(
                    'Smith',
                    style: TextStyle(
                      fontFamily: 'Roboto-Regular',
                      fontSize: 35.0000114440918,
                      color: const Color(0xff414040),
                      height: 0.7421797369233037,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(1753.72, 1090.72),
                  child:
                      // Adobe XD layer: 'Ellipse 531' (shape)
                      Container(
                    width: 99.6,
                    height: 99.6,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(49.78, 49.78)),
                      color: const Color(0xffffffff),
                      border: Border.all(
                          width: 6.0, color: const Color(0xff73c700)),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(1782.57, 1133.74),
                  child: Text(
                    'VS',
                    style: TextStyle(
                      fontFamily: 'Roboto-Medium',
                      fontSize: 34.35968017578125,
                      color: const Color(0xff414040),
                      height: 0.649407461865995,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                // Adobe XD layer: 'Ellipse 532 copy 2' (group)
                Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(1419.0, 1053.88),
                      child:
                          // Adobe XD layer: 'Ellipse 532 copy 2' (shape)
                          Container(
                        width: 137.0,
                        height: 137.1,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(68.5, 68.56)),
                          color: const Color(0xffffffff),
                          border: Border.all(
                              width: 1.0, color: const Color(0xff9aa03c)),
                        ),
                      ),
                    ),
                    // Adobe XD layer: 'Clip' (group)
                    Stack(
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(1416.0, 1055.0),
                          child:
                              // Adobe XD layer: 'smith' (shape)
                              Container(
                            width: 141.0,
                            height: 142.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage(''),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(1419.0, 1053.88),
                          child:
                              // Adobe XD layer: 'Ellipse 532 copy 2' (shape)
                              Container(
                            width: 137.0,
                            height: 137.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(68.5, 68.56)),
                              color: const Color(0xffffffff),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff9aa03c)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Adobe XD layer: 'Ellipse 532 copy 2' (group)
                Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(2027.02, 1058.0),
                      child:
                          // Adobe XD layer: 'Ellipse 532 copy 2' (shape)
                          Container(
                        width: 137.0,
                        height: 137.0,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(68.5, 68.5)),
                          color: const Color(0xffffffff),
                          border: Border.all(
                              width: 1.0, color: const Color(0xff9aa03c)),
                        ),
                      ),
                    ),
                    // Adobe XD layer: 'Clip' (group)
                    Stack(
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(2019.0, 1057.0),
                          child:
                              // Adobe XD layer: 'sm' (shape)
                              Container(
                            width: 150.0,
                            height: 150.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage(''),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(2008.0, 1049.0),
                          child:
                              // Adobe XD layer: 'Rectangle 551' (shape)
                              Container(
                            width: 164.0,
                            height: 169.0,
                            color: const Color(0x80000000),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(2027.02, 1058.0),
                          child:
                              // Adobe XD layer: 'Ellipse 532 copy 2' (shape)
                              Container(
                            width: 137.0,
                            height: 137.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(68.5, 68.5)),
                              color: const Color(0xffffffff),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff9aa03c)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Transform.translate(
                  offset: Offset(2005.34, 1238.26),
                  child: Text(
                    'Robert Doe',
                    style: TextStyle(
                      fontFamily: 'Roboto-Regular',
                      fontSize: 35.0000114440918,
                      color: const Color(0xffadadad),
                      height: 0.7421797369233037,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(1630.07, 1331.89),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontFamily: 'Roboto-Medium',
                        fontSize: 50,
                        color: const Color(0xff414040),
                        height: 0.4462686538696289,
                      ),
                      children: [
                        TextSpan(
                          text: '6  :  ',
                        ),
                        TextSpan(
                          text: '3',
                          style: TextStyle(
                            color: const Color(0xffadadad),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(1868.07, 1334.89),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontFamily: 'Roboto-Medium',
                        fontSize: 50,
                        color: const Color(0xff414040),
                        height: 0.4462686538696289,
                      ),
                      children: [
                        TextSpan(
                          text: '5  :  ',
                        ),
                        TextSpan(
                          text: '2',
                          style: TextStyle(
                            color: const Color(0xffafafaf),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(1385.0, 1029.0),
                  child:
                      // Adobe XD layer: 'Ellipse 532' (shape)
                      Container(
                    width: 69.0,
                    height: 69.0,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(34.5, 34.5)),
                      color: const Color(0xff070606),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(1400.0, 1048.0),
                  child:
                      // Adobe XD layer: 'cup bronze' (shape)
                      Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(''),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(1560.0, 1312.0),
                  child:
                      // Adobe XD layer: 'Levels 1 copy' (shape)
                      Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(''),
                        fit: BoxFit.fill,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.dstIn),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(1723.52, 932.42),
                  child: Text(
                    'Round : 2',
                    style: TextStyle(
                      fontFamily: 'Roboto-Medium',
                      fontSize: 39.62458038330078,
                      color: const Color(0xff6bb801),
                      height: 0.9629628203392859,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(-1225.0, 0.0),
            child:
                // Adobe XD layer: 'Card 1' (group)
                Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(1252.0, 279.0),
                  child:
                      // Adobe XD layer: 'card1' (shape)
                      Container(
                    width: 1075.0,
                    height: 574.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x47000000),
                          offset: Offset(0, 0),
                          blurRadius: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(1649.0, 325.0),
                  child:
                      // Adobe XD layer: 'back copy 6' (shape)
                      Container(
                    width: 14.0,
                    height: 28.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(''),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(1932.0, 325.0),
                  child:
                      // Adobe XD layer: 'back copy 7' (shape)
                      Container(
                    width: 14.0,
                    height: 28.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(''),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(1380.34, 625.26),
                  child: Text(
                    'Robert Wills',
                    style: TextStyle(
                      fontFamily: 'Roboto-Regular',
                      fontSize: 35.0000114440918,
                      color: const Color(0xff414040),
                      height: 0.7421797369233037,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(1753.72, 476.72),
                  child:
                      // Adobe XD layer: 'Ellipse 531' (shape)
                      Container(
                    width: 99.6,
                    height: 99.6,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(49.78, 49.78)),
                      color: const Color(0xffffffff),
                      border: Border.all(
                          width: 6.0, color: const Color(0xff73c700)),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(1782.57, 519.74),
                  child: Text(
                    'VS',
                    style: TextStyle(
                      fontFamily: 'Roboto-Medium',
                      fontSize: 34.35968017578125,
                      color: const Color(0xff414040),
                      height: 0.649407461865995,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                // Adobe XD layer: 'Ellipse 532 copy 2' (group)
                Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(1419.0, 439.88),
                      child:
                          // Adobe XD layer: 'Ellipse 532 copy 2' (shape)
                          Container(
                        width: 137.0,
                        height: 137.1,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(68.5, 68.56)),
                          color: const Color(0xffffffff),
                          border: Border.all(
                              width: 1.0, color: const Color(0xff9aa03c)),
                        ),
                      ),
                    ),
                    // Adobe XD layer: 'Clip' (group)
                    Stack(
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(1419.0, 446.0),
                          child:
                              // Adobe XD layer: 'img' (shape)
                              Container(
                            width: 137.0,
                            height: 127.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage(
                                    'assets/images/player.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(1419.0, 439.88),
                          child:
                              // Adobe XD layer: 'Ellipse 532 copy 2' (shape)
                              Container(
                            width: 137.0,
                            height: 137.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(68.5, 68.56)),
                              color: const Color(0xffffffff),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff9aa03c)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Adobe XD layer: 'Ellipse 532 copy 2' (group)
                Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(2027.02, 444.0),
                      child:
                          // Adobe XD layer: 'Ellipse 532 copy 2' (shape)
                          Container(
                        width: 137.0,
                        height: 137.0,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(68.5, 68.5)),
                          color: const Color(0xffffffff),
                          border: Border.all(
                              width: 1.0, color: const Color(0xff9aa03c)),
                        ),
                      ),
                    ),
                    // Adobe XD layer: 'Clip' (group)
                    Stack(
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(2030.0, 447.0),
                          child:
                              // Adobe XD layer: 'tyty' (shape)
                              Container(
                            width: 133.0,
                            height: 131.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage(''),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(2008.0, 435.0),
                          child:
                              // Adobe XD layer: 'Rectangle 551' (shape)
                              Container(
                            width: 164.0,
                            height: 169.0,
                            color: const Color(0x80000000),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(2027.02, 444.0),
                          child:
                              // Adobe XD layer: 'Ellipse 532 copy 2' (shape)
                              Container(
                            width: 137.0,
                            height: 137.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(68.5, 68.5)),
                              color: const Color(0xffffffff),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff9aa03c)),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(2027.02001953125, 444),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 137.0,
                              height: 137.0,
                              child:
                                  GestureDetector(onTap: () => player2?.call()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Transform.translate(
                  offset: Offset(1999.34, 624.26),
                  child: Text(
                    'Stewart Sun',
                    style: TextStyle(
                      fontFamily: 'Roboto-Regular',
                      fontSize: 35.0000114440918,
                      color: const Color(0xffadadad),
                      height: 0.7421797369233037,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(1630.07, 717.89),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontFamily: 'Roboto-Medium',
                        fontSize: 50,
                        color: const Color(0xff414040),
                        height: 0.4462686538696289,
                      ),
                      children: [
                        TextSpan(
                          text: '7  :  ',
                        ),
                        TextSpan(
                          text: '6',
                          style: TextStyle(
                            color: const Color(0xffadadad),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(1868.07, 720.89),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontFamily: 'Roboto-Medium',
                        fontSize: 50,
                        color: const Color(0xff414040),
                        height: 0.4462686538696289,
                      ),
                      children: [
                        TextSpan(
                          text: '4  :  ',
                        ),
                        TextSpan(
                          text: '5',
                          style: TextStyle(
                            color: const Color(0xffafafaf),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(1385.0, 415.0),
                  child:
                      // Adobe XD layer: 'Ellipse 532' (shape)
                      Container(
                    width: 69.0,
                    height: 69.0,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(34.5, 34.5)),
                      color: const Color(0xff070606),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(1400.0, 434.0),
                  child:
                      // Adobe XD layer: 'cup bronze' (shape)
                      Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(''),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(1560.0, 698.0),
                  child:
                      // Adobe XD layer: 'Levels 1 copy' (shape)
                      Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(''),
                        fit: BoxFit.fill,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.dstIn),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(1723.52, 318.42),
                  child: Text(
                    'Round : 1',
                    style: TextStyle(
                      fontFamily: 'Roboto-Medium',
                      fontSize: 39.62458038330078,
                      color: const Color(0xff6bb801),
                      height: 0.9629628203392859,
                    ),
                    textAlign: TextAlign.left,
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
