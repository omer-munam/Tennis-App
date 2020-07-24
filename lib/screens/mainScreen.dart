import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tennis_event/screens/user/registerScreen.dart';
import 'package:tennis_event/utilities/constants.dart';
import 'package:tennis_event/utilities/styles.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main_screens';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 75.0,
                    ),
                    child: Image.asset(
                      'assets/images/slider_image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Join a Game',
              style: kMainTextStyleHeader,
            ),
            Text(
              'Let\'s Play a Game',
              style: kMainTextStyleSubHeader,
            ),
            SizedBox(
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      color: kButtonColorBlue,
                      shape: StadiumBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Register with Phone No.',
                          style: kMainTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
