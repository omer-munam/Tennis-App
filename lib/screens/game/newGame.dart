import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tennis_event/models/game.dart';
import 'package:tennis_event/screens/game/gameDetail.dart';
import 'package:tennis_event/screens/user/userGames.dart';
import 'package:tennis_event/services/database.dart';
import 'package:tennis_event/utilities/constants.dart';
import 'package:tennis_event/utilities/loader.dart';
import 'package:tennis_event/utilities/styles.dart';
import 'package:tennis_event/widgets/bottomButton.dart';
import 'package:tennis_event/widgets/newGameField.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewGames extends StatefulWidget {
  static const String id = 'new_games_screen';
  @override
  _NewGameState createState() => _NewGameState();
}

class _NewGameState extends State<NewGames> {
  int _selectedIndex = 2;
  DateTime selectedDate;
  String chooseCourt;
  String gameType;
  String currency;
  bool isTournament;
  String tournament;
  final formatTime = DateFormat.jm();
  DateTime timeSelected;
  FirebaseAuth _auth;
  FirebaseUser currentUser;
  bool loading = false;
  DatabaseService _databaseService = DatabaseService();

  TextEditingController _controller1, _controller2, _controller3, _controller4;

  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
    _controller4 = TextEditingController();
  }

  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
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
                'New Game',
                style: kAppbarStyle,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  NewGFields(
                    controller: _controller1,
                    labelText: 'Game Name',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 2.0,
                    ),
                    child: DateField(
                      label: 'Select Date',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(
                            color: kDividerLineGray,
                            width: 2.0,
                          ),
                        ),
                      ),
                      onDateSelected: (DateTime value) {
                        setState(() {
                          selectedDate = value;
                        });
                      },
                      selectedDate: selectedDate,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 2.0,
                    ),
                    child: DateTimeField(
                      controller: _controller3,
                      showCursor: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(
                            color: kDividerLineGray,
                            width: 2.0,
                          ),
                        ),
                      ),
                      format: formatTime,
                      onShowPicker: (context, currentValue) async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                              currentValue ?? DateTime.now()),
                        );
                        timeSelected = DateTimeField.convert(time);
                        return timeSelected;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 2.0),
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
                        value: chooseCourt,
                        items: <String>[
                          'Choose Court',
                          'Location 1',
                          'Location 2',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value != 'Choose Court' ? value : null,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            chooseCourt = newValue;
                            print(newValue);
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 2.0),
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
                        value: gameType,
                        items: <String>[
                          'Choose Game Type',
                          'Single',
                          'Double',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value != 'Choose Game Type' ? value : null,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String newgameType) {
                          setState(() {
                            gameType = newgameType;
                            print(newgameType);
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 2.0),
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
                        value: tournament,
                        items: <String>[
                          'Tournament',
                          'Yes',
                          'No',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value != 'Choose Tournament' ? value : null,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String newtournament) {
                          setState(() {
                            tournament = newtournament;
                            if (newtournament == 'Yes') {
                              isTournament = true;
                            } else {
                              isTournament = false;
                            }
                            print('Tournament: $isTournament');
                          });
                        },
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            top: 2.0,
                          ),
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
                              value: currency,
                              items: <String>[
                                'Choose Currency',
                                'USD',
                                'SR',
                                'PKR',
                                'INR',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value:
                                      value != 'Choose Currency' ? value : null,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String newcurrency) {
                                setState(() {
                                  currency = newcurrency;
                                  print(newcurrency);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: NewGFields(
                          controller: _controller4,
                          labelText: 'Price',
                        ),
                      )
                    ],
                  ),
                  NewGFields(
                    controller: _controller2,
                    labelText: 'Notes',
                  ),
                  BottomButton(
                    buttonTitle: 'Create Game',
                    tapping: () async {
                      if (_controller1.text == "" ||
                          selectedDate == null ||
                          formatTime == null ||
                          chooseCourt == null ||
                          gameType == null ||
                          isTournament == null ||
                          currency == null ||
                          _controller4.text == "" ||
                          _controller2.text == "") {
                        print("All Fields Mandatory");
                        return;
                      }
                      setState(() => loading = true);

                      _auth = FirebaseAuth.instance;
                      currentUser = await _auth.currentUser();

                      print('formatTime: ${_controller3.text}');
                      print('timeSelected: $timeSelected');
                      print('selectedDate: $selectedDate');

                      selectedDate = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        timeSelected.hour,
                        timeSelected.minute,
                        timeSelected.second,
                        timeSelected.millisecond,
                        timeSelected.microsecond,
                      );

                      Game game = Game(
                        name: _controller1.text,
                        courtLocation: chooseCourt,
                        type: gameType,
                        tournament: isTournament,
                        currency: currency,
                        price: _controller4.text,
                        notes: _controller2.text,
                        organizerId: currentUser.uid,
                        time: Timestamp.fromDate(selectedDate),
                      );

                      createGame(game, context);
                    },
                  ),
                ],
              ),
            ),
          );
  }

  void createGame(Game game, BuildContext context) async {
    dynamic result = await _databaseService.createGame(game);
    if (result == null) {
      print('Error Registering..');
      setState(() => loading = false);
    } else {
      print(result);
      Fluttertoast.showToast(
        msg: 'New Game Created',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyGames(),
        ),
      );
    }
  }
}
