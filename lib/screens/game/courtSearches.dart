import 'package:flutter/material.dart';

class RecentCourtSearches extends StatefulWidget {
  static const String id = 'recent_court_searches_screen';

  @override
  _RecentCourtSearchesState createState() => _RecentCourtSearchesState();
}

class _RecentCourtSearchesState extends State<RecentCourtSearches> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Green Court',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(37.0),
          color: const Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              color: const Color(0x63000000),
              offset: Offset(0, 0),
              blurRadius: 8,
            ),
          ],
        ),
      ),
    );
  }
}
