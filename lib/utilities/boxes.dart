import 'package:flutter/material.dart';
import 'package:tennis_event/utilities/constants.dart';

class DividerLine extends StatelessWidget {
  DividerLine({this.width});

  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Divider(
        color: kMainThemeColor,
      ),
    );
  }
}
