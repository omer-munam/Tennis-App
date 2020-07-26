import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tennis_event/screens/mainScreen.dart';
import 'package:tennis_event/screens/user/userGames.dart';
import 'package:tennis_event/utilities/constants.dart';
import 'package:tennis_event/widgets/bottomMenuBar.dart';

class Splash extends StatefulWidget {
  static const String id = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 10,
      navigateAfterSeconds: MainScreen.id,
      title: Text(
        'Tennis Event Registration',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: Image.asset(
        'assets/images/slider_image.png',
        fit: BoxFit.cover,
      ),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: TextStyle(),
      loadingText: Text('Loading...'),
      photoSize: 150.0,
      onClick: () => print("Loading Done"),
      loaderColor: kMainThemeColor,
    );
  }

  void startTimer() {
    Timer(Duration(seconds: 5), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  void navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    print(status);
    if (status) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomMenuBar(),
        ),
      );
    } else {
      Navigator.pushReplacementNamed(context, MainScreen.id);
    }
  }
}
