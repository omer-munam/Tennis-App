import 'package:flutter/material.dart';
import 'package:tennis_event/utilities/constants.dart';
import 'package:tennis_event/utilities/styles.dart';

class BottomButton extends StatelessWidget {
  BottomButton({
    @required this.buttonTitle,
    @required this.tapping,
  });

  final Function tapping;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
//      onTap: tapping,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                color: kMainThemeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(color: kMainThemeColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    buttonTitle,
                    style: kRegisterBottomButton,
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: tapping,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
