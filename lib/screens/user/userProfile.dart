import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tennis_event/screens/settings.dart';
import 'package:tennis_event/utilities/constants.dart';
import 'package:tennis_event/utilities/styles.dart';
import 'package:tennis_event/widgets/bottomButton.dart';
import 'package:tennis_event/widgets/bottomMenuBar.dart';
import 'package:tennis_event/widgets/newGameField.dart';

class UserProfile extends StatefulWidget {
  static const String id = 'user_profile_screen';

  final String cCode;
  final String phoneNumber;

  UserProfile({this.cCode, this.phoneNumber});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String myGender = 'Choose Gender';
  String myYob = 'Choose Year of Birth';
  String myLevel = 'Choose Play Level';
  String side = 'Choose Side';
  String username;
  TextEditingController _controller1, _controller2;

  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
  }

  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    print('Country code: ${widget.cCode}');
    print('Phone No: ${widget.phoneNumber}');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
            ),
            tooltip: 'Settings Page',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Settings(),
                ),
              );
            },
          ),
        ],
        backgroundColor: kMainThemeColor,
        centerTitle: true,
        title: Text(
          'Profile',
          style: kAppbarStyle,
        ),
      ),
      body: SingleChildScrollView(
        reverse: false,
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/images/playerImage.png'),
            ),
            NewGFields(
              onchange: username,
              controller: _controller1,
              labelText: 'Username',
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 2.0,
                      color: kDividerLineGray,
                      style: BorderStyle.solid),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CountryListPick(
                      isShowFlag: true,
                      isShowTitle: true,
                      isDownIcon: true,
                      showEnglishName: true,
                      onChanged: (CountryCode code) {
                        code = widget.cCode as CountryCode;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2.0,
                    color: kDividerLineGray,
                    style: BorderStyle.solid,
                  ),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: side,
                  items: <String>[
                    'Choose Side',
                    'Left Sided',
                    'Right Sided',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      side = newValue;
                      print(newValue);
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2.0,
                    color: kDividerLineGray,
                    style: BorderStyle.solid,
                  ),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: myLevel,
                  items: <String>[
                    'Choose Play Level',
                    'Beginner',
                    'Intermediate',
                    'Professional',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      myLevel = newValue;
                      print(newValue);
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2.0,
                    color: kDividerLineGray,
                    style: BorderStyle.solid,
                  ),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: myGender,
                  items: <String>[
                    'Choose Gender',
                    'Male',
                    'Female',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String newgender) {
                    setState(() {
                      myGender = newgender;
                      print(newgender);
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2.0,
                    color: kDividerLineGray,
                    style: BorderStyle.solid,
                  ),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: myYob,
                  items: <String>[
                    'Choose Year of Birth',
                    '1990',
                    '1991',
                    '1992',
                    '1993',
                    '1994',
                    '1995',
                    '1996',
                    '1997',
                    '1998',
                    '1999',
                    '2001',
                    '2002',
                    '2003',
                    '2004',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String newYob) {
                    setState(() {
                      myYob = newYob;
                      print(newYob);
                    });
                  },
                ),
              ),
            ),
            NewGFields(
              onchange: () {
                widget.phoneNumber;
              },
              controller: _controller2,
              labelText: 'Phone Number',
            ),
            BottomButton(
              buttonTitle: 'Save',
              tapping: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomMenuBar(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
