import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_event/Models/user.dart';
import 'package:tennis_event/utilities/boxes.dart';
import 'package:tennis_event/utilities/constants.dart';
import 'package:tennis_event/utilities/loader.dart';
import 'package:tennis_event/utilities/styles.dart';
import 'package:tennis_event/widgets/userRanking.dart';

class UserRanking extends StatefulWidget {
  static const String id = 'user_ranking_screen';
  @override
  _RankingState createState() => _RankingState();
}

class _RankingState extends State<UserRanking> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 2;
    bool loading = false;
    List<User> users = Provider.of<List<User>>(context);
    if (users == null) {
      loading = true;
    } else {
      loading = false;
      users.sort((a, b) => b.points.compareTo(a.points));
    }
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: kMainThemeColor,
              centerTitle: true,
              title: Text(
                'Ranking',
                style: kAppbarStyle,
              ),
            ),
            body: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(25, 10, 10, 10),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 25.0,
                                  backgroundImage:
                                      NetworkImage(users[index].image),
                                ),
                                Text(
                                  'Rank ${index + 1}',
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 25.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    users[index].userName,
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 15,
                                      color: kDividerLineGray,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        child: Image.asset(
                                          'assets/icons/ball_icon.png',
                                        ),
                                        backgroundColor: Colors.transparent,
                                        radius: 10,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${users[index].points} Points',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    DividerLine(),
                  ],
                );
              },
            ),
          );
  }
}
