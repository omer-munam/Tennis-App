import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tennis_event/Models/court.dart';
import 'package:tennis_event/Widgets/newGameField.dart';
import 'package:tennis_event/screens/game/gameDetail.dart';
import 'package:tennis_event/utilities/constants.dart';
import 'package:tennis_event/utilities/loader.dart';
import 'package:tennis_event/utilities/styles.dart';
import 'package:tennis_event/widgets/bottomButton.dart';
import 'package:tennis_event/services/database.dart';

class NewTennisCourt extends StatefulWidget {
  static const String id = 'new_tennis_court_screen';
  @override
  _NewTennisCourtState createState() => _NewTennisCourtState();
}

class _NewTennisCourtState extends State<NewTennisCourt> {
  String courtName;
  String country;
  String street;
  String postal;
  String city;
  String phone;
  String email;
  DatabaseService _db = new DatabaseService();
  bool loading = false;

  TextEditingController _controller1,
      _controller2,
      _controller3,
      _controller4,
      _controller5,
      _controller6,
      _controller7;

  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
    _controller4 = TextEditingController();
    _controller5 = TextEditingController();
    _controller6 = TextEditingController();
    _controller7 = TextEditingController();
  }

  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    _controller7.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: kMainThemeColor,
              centerTitle: true,
              title: Text(
                'Add New Tennis Court',
                style: kAppbarStyle,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  NewGFields(
                    controller: _controller1,
                    labelText: 'Court Name',
                    onchange: courtName,
                  ),
                  NewGFields(
                    controller: _controller2,
                    labelText: 'Country',
                    onchange: country,
                  ),
                  NewGFields(
                    controller: _controller3,
                    labelText: 'Street',
                    onchange: street,
                  ),
                  NewGFields(
                    controller: _controller4,
                    labelText: 'Postal',
                    onchange: postal,
                  ),
                  NewGFields(
                    controller: _controller5,
                    labelText: 'City',
                    onchange: city,
                  ),
                  NewGFields(
                    controller: _controller6,
                    labelText: 'Phone No.',
                    onchange: phone,
                  ),
                  NewGFields(
                    controller: _controller7,
                    labelText: 'Email',
                    onchange: email,
                  ),
                  BottomButton(
                    buttonTitle: 'Submit',
                    tapping: () {
                      if (_controller1.text == "" ||
                          _controller2.text == "" ||
                          _controller3.text == "" ||
                          _controller4.text == "" ||
                          _controller5.text == "" ||
                          _controller6.text == "" ||
                          _controller7.text == "") {
                        Fluttertoast.showToast(
                          msg: 'All Fields are mandatory',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                        return;
                      }
                      setState(() => loading = true);

                      Court court = new Court(
                        courtname: _controller1.text.trim(),
                        street: _controller3.text.trim(),
                        postalcode: _controller4.text.trim(),
                        country: _controller2.text.trim(),
                        city: _controller5.text.trim(),
                        telephone: _controller6.text.trim(),
                        email: _controller7.text.trim(),
                      );

                      createCourt(court, context);
                    },
                  ),
                ],
              ),
            ),
          );
  }

  void createCourt(Court court, BuildContext context1) async {
    print(court.toJson());
    dynamic result = await _db.createCourt(court);

    if (result == null) {
      print("Error Adding Court");
      setState(() => loading = false);
    } else {
      Fluttertoast.showToast(
        msg: 'New Court Created',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      Navigator.pop(context);
      // Navigator.push(
      //   context1,
      //   MaterialPageRoute(
      //     builder: (context) => GameDetails(),
      //   ),
      // );
    }
  }
}
