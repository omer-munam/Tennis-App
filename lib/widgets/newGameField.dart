import 'package:flutter/material.dart';
import 'package:tennis_event/utilities/constants.dart';

class NewGFields extends StatelessWidget {
  const NewGFields({
    Key key,
    @required TextEditingController controller,
    this.hintText,
    @required this.labelText,
    this.onchange,
  })  : _controller = controller,
        super(key: key);

//  NewGFields({
//    @required this.labelText,
//    @required this.onchange,
//    this.hintText,
//    @required this.controller,
//  });

  final String hintText;
  final String labelText;
  final dynamic onchange;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    bool _validate = false;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      child: TextField(
        onChanged: onchange,
        onSubmitted: (onchange) {
          print(onchange);
        },
        controller: _controller,
        decoration: InputDecoration(
          errorText: _validate ? 'Enter Text' : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: kDividerLineGray,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: kDividerLineGray,
            ),
          ),
          labelText: labelText,
          hintText: hintText,
        ),
      ),
    );
  }
}
