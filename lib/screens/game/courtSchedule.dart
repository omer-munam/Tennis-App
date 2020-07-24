import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:tennis_event/utilities/constants.dart';
import 'package:tennis_event/utilities/styles.dart';

class CourtSchedule extends StatefulWidget {
  static const String id = 'court_schedule_screen';
  @override
  _CourtScheduleState createState() => _CourtScheduleState();
}

class _CourtScheduleState extends State<CourtSchedule> {
  var _countryList = [
    'Select Court',
    'Location 1',
    'Location 2',
    'Location 3',
  ];
  var _currentSelectedItem = 'Select Court';

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 1;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kMainThemeColor,
        centerTitle: true,
        flexibleSpace: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.up,
          children: [
            Text(
              'Date & Time',
              style: kAppbarStyle,
            ),
            Text(
              'Court Schedule',
              style: kAppbarCourtStyle,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          'Courts',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                      width: 486.1,
                      height: 117.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(58.5),
                        color: const Color(0xffffffff),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff757575)),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x87636363),
                            offset:
                                Offset(1.6383041143417358, 1.1471529006958008),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          'Trainers',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                      width: 984.0,
                      height: 117.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
//                        color: const Color(0x57e6e6e6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                shape: BoxShape.rectangle,
                border: Border.all(
                    width: 2.0,
                    color: kDividerLineGray,
                    style: BorderStyle.solid),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                hint: new Text("Select Court"),
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
                  setState(() {
                    this._currentSelectedItem = newValueSelected;
                  });
                },
                value: _currentSelectedItem,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey,
              alignment: AlignmentDirectional.center,
              padding: EdgeInsets.only(
                bottom: 8,
              ),
              margin: EdgeInsets.only(
                bottom: 8,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        left: 8.0,
                      ),
                      child: GridView.count(
                        crossAxisCount: 1,
                        children: List<Widget>.generate(1, (index) {
                          return GridTile(
                            child: Card(
                              color: Colors.grey,
                              shadowColor: Colors.transparent,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: GridView.count(
                      crossAxisCount: 5,
                      children: List<Widget>.generate(5, (index) {
                        return GridTile(
                          child: Card(
                            color: Colors.grey,
                            shadowColor: Colors.transparent,
                            child: Center(
                              child: Text(
                                '$index',
                                style: kCourtScheduleCardTile,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8.0,
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: GridView.count(
                      crossAxisCount: 1,
                      children: List<Widget>.generate(8, (index) {
                        return GridTile(
                          child: Card(
                              child: Center(
                            child: Text('$index' ':00'),
                          )),
                        );
                      }),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8.0,
                      right: 8.0,
                    ),
                    child: GridView.count(
                      crossAxisCount: 5,
                      children: List<Widget>.generate(40, (index) {
                        return GridTile(
                          child: Card(
                            color: kMainThemeColor,
//                            child: Center(
//                              child: Text('$index'),
//                            ),
                          ),
                        );
                      }),
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
