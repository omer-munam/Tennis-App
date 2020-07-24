import 'package:flutter/material.dart';
import 'package:tennis_event/utilities/constants.dart';
import 'package:tennis_event/utilities/styles.dart';

class Settings extends StatefulWidget {
  static const String id = 'setting_screen';
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;
  bool isNotSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kMainThemeColor,
        centerTitle: true,
        title: Text(
          'Settings',
          style: kAppbarStyle,
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            child: Divider(
              height: 10.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Calculate Ranking"),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeTrackColor: kActiveToggleButton,
                  activeColor: kMainThemeColor,
                ),
              ],
            ),
          ),
          SizedBox(
            child: Divider(
              height: 5.0,
              color: kDividerLineGray,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notification for Chat"),
                Switch(
                  value: isNotSwitched,
                  onChanged: (value) {
                    setState(() {
                      isNotSwitched = value;
                    });
                  },
                  activeTrackColor: kActiveToggleButton,
                  activeColor: kMainThemeColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
