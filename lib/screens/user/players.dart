import 'package:flutter/material.dart';
import 'package:tennis_event/Widgets/playersCard.dart';
import 'package:tennis_event/utilities/constants.dart';
import 'package:tennis_event/utilities/styles.dart';

class Players extends StatefulWidget {
  static const String id = 'players_screen';
  @override
  _PlayersState createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kMainThemeColor,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Next page',
            onPressed: () {},
          ),
        ],
        title: Text(
          'Players',
          style: kAppbarStyle,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              PlayersCard(),
              PlayersCard(),
            ],
          ),
        ],
      ),
    );
  }
}
