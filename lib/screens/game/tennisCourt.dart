import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_event/Models/court.dart';
import 'package:tennis_event/Widgets/newGameField.dart';
import 'package:tennis_event/services/database.dart';
import 'package:tennis_event/utilities/constants.dart';
import 'package:tennis_event/utilities/styles.dart';

import 'courtSearches.dart';
import 'createTennisCourt.dart';

class TennisCourt extends StatefulWidget {
  static const String id = 'tennis_court_screen';
  @override
  _TennisCourtState createState() => _TennisCourtState();
}

class _TennisCourtState extends State<TennisCourt> {
  var _countryList = [
    'Select Country',
    'Pakistan',
    'India',
  ];
  String searchVal = "", countryVal = "";
  List<Court> courts, filteredCourts;
  bool all = true;
  var _currentSelectedItem = 'Select Country';
  @override
  Widget build(BuildContext context) {
    DatabaseService _db = DatabaseService();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kMainThemeColor,
        centerTitle: true,
        title: Text(
          'Tennis Court',
          style: kAppbarStyle,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    width: 2.0,
                    color: kDividerLineGray,
                    style: BorderStyle.solid),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                hint: new Text("Select Country"),
                items: _countryList
                    .map(
                      (String dropDownStringItem) => DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(
                          dropDownStringItem,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (String newValueSelected) {
                  countryVal = newValueSelected == 'Select Country'
                      ? ""
                      : newValueSelected;
                  search(value: searchVal, country: countryVal);
                  setState(() {
                    this._currentSelectedItem = newValueSelected;
                  });
                },
                value: _currentSelectedItem,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
//              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                NewGFields(
                  labelText: 'Search Court Here',
                  controller: null,
                  onchange: (value) {
                    searchVal = value;
                    search(value: value, country: countryVal);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Text('Recent Search'),
                ),
                StreamBuilder(
                  stream: _db.courts,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return SizedBox();
                    } else {
                      courts = snapshot.data;
                      filteredCourts = all ? courts : filteredCourts;
                      all = false;
                      return SizedBox(
                        // Horizontal ListView
                        height: 100,
                        child: ListView.builder(
                          itemCount: 1,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (filteredCourts != null)
                                  for (Court court in filteredCourts)
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context, court);
                                      },
                                      child: RecentCourtSearches(
                                        courtName: court.courtname +
                                            ': (' +
                                            court.city +
                                            ', ' +
                                            court.country +
                                            ')',
                                      ),
                                    )
                              ],
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlatButton(
                  color: kMainThemeColor,
                  shape: StadiumBorder(),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Add New Court',
                          style: kMainTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewTennisCourt(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void search({value = "", country = ""}) {
    filteredCourts.clear();
    for (Court court in courts) {
      if (court.courtname
              .toLowerCase()
              .contains(value.toString().toLowerCase()) &&
          court.country
              .toLowerCase()
              .contains(country.toString().toLowerCase())) {
        filteredCourts.add(court);
      }
    }
    setState(() {});
  }
}
