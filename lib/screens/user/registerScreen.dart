import 'package:country_list_pick/country_list_pick.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tennis_event/screens/user/userProfile.dart';
import 'package:tennis_event/services/database.dart';
import 'package:tennis_event/utilities/constants.dart';
import 'package:tennis_event/utilities/loader.dart';
import 'package:tennis_event/utilities/styles.dart';
import 'package:tennis_event/widgets/bottomButton.dart';
import 'package:tennis_event/widgets/bottomMenuBar.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var countrycode;
  var phonenumber;
  String phoneNo;
  String smsOTP;
  String verificationId;
  String errorMessage = '';
  FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseService _db = DatabaseService();
  final _text = TextEditingController();
  final _code = TextEditingController();
  bool _validate = false;
  bool _codeValidate = false;
  bool loading = false;

  @override
  void dispose() {
    _text.dispose();
    _code.dispose();
    super.dispose();
  }

  Future<void> verifyPhone() async {
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      Fluttertoast.showToast(
        msg: 'Your OTP has been sent to your mobile phone.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      print('sign in');
    };
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        codeAutoRetrievalTimeout: (String verId) {
          this.verificationId = verId;
        },
        codeSent:
            smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
        timeout: const Duration(seconds: 60),
        verificationCompleted: (AuthCredential phoneAuthCredential) async {
          //This callback would be called when verification is done automatically
          print(phoneAuthCredential);

          AuthResult result =
              await _auth.signInWithCredential(phoneAuthCredential);
          FirebaseUser user = result.user;
          FirebaseUser currentUser = await _auth.currentUser();
          assert(user.uid == currentUser.uid);

          await _db.checkUser(currentUser.uid).then(
            (bool value) async {
              loading = false;
              if (value) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('isLoggedIn', true);
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomMenuBar(),
                  ),
                );
              } else {
                if (user != null) {
                  print('Code auto retrieval successfull');
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfile(
                        cCode: countrycode,
                        phoneNumber: phonenumber,
                        uidUser: user.uid,
                      ),
                    ),
                  );
                } else {
                  print('Error: user is null');
                }
              }
            },
          );
        },
        verificationFailed: (AuthException exception) {
          print('Verification failed: ${exception.message}');
        },
      );
    } catch (e) {
      loading = false;
      handleError(e);
    }
  }

  // Future<bool> smsOTPDialog(BuildContext context) {
  //   print('dialog box');
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Enter SMS Code'),
  //         content: Container(
  //           height: 100,
  //           child: Column(
  //             children: [
  //               TextField(
  //                 controller: _code,
  //                 decoration: InputDecoration(
  //                   errorText: _codeValidate ? 'Value Can\'t Be Empty' : null,
  //                 ),
  //                 onChanged: (value) {
  //                   this.smsOTP = value;
  //                 },
  //               ),
  //               (errorMessage != ''
  //                   ? Text(
  //                       errorMessage,
  //                       style: TextStyle(color: Colors.red),
  //                     )
  //                   : Container())
  //             ],
  //           ),
  //         ),
  //         contentPadding: EdgeInsets.all(10),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text('Register'),
  //             onPressed: () {
  //               setState(() {
  //                 _code.text.isEmpty
  //                     ? _codeValidate = true
  //                     : _codeValidate = false;
  //                 Navigator.of(context).pop();
  //                 smsOTPDialog(context);
  //               });
  //               print(_codeValidate);
  //               print(_code.text);
  //               if (!_codeValidate) {
  //                 signIn();
  //               }
  //             },
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }

  signIn() async {
    try {
      loading = true;
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );

      AuthResult result = await _auth.signInWithCredential(credential);
      FirebaseUser user = result.user;
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);

      await _db.checkUser(currentUser.uid).then(
        (bool value) async {
          loading = false;
          if (value) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool('isLoggedIn', true);
            Navigator.of(context).pop();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BottomMenuBar(),
              ),
            );
          } else {
            if (user != null) {
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfile(
                    cCode: countrycode,
                    phoneNumber: phonenumber,
                    uidUser: currentUser.uid,
                  ),
                ),
              );
            } else {
              print('Error: user is null');
            }
          }
        },
      );
    } catch (e) {
      loading = false;
      handleError(e);
    }
  }

  handleError(PlatformException error) {
    print(error);
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(new FocusNode());
        Fluttertoast.showToast(
          msg: 'Invalid Code! Please Try Again',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        print('sign in');
        break;
      default:
        setState(() {
          errorMessage = error.message;
        });

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var _controller2;

    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white10,
              centerTitle: true,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                'Register Now',
                style: kAppbarStyleRegister,
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/images/racket_image.png',
                    height: 200,
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0,
                                color: kDividerLineGray,
                                style: BorderStyle.solid),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CountryListPick(
                                isShowFlag: true,
                                isShowTitle: true,
                                isShowCode: true,
                                isDownIcon: true,
                                showEnglishName: true,
                                onChanged: (CountryCode code) {
                                  setState(() {
                                    countrycode = code.dialCode;
                                    print(countrycode);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: TextField(
                                  controller: _text,
                                  decoration: InputDecoration(
                                    errorText: _validate
                                        ? 'Value Can\'t Be Empty'
                                        : null,
                                    border: OutlineInputBorder(
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
                                    hintText: '1234567890',
                                    labelText: 'Phone No.',
                                  ),
                                  onChanged: (value) {
                                    phonenumber = value;
                                    print(phonenumber);
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  side: BorderSide(color: kMainThemeColor),
                                ),
                                color: Colors.white,
                                child: Text(
                                  'Verify',
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      _text.text.isEmpty
                                          ? _validate = true
                                          : _validate = false;
                                    },
                                  );
                                  if (!_validate) {
                                    print(_validate);
                                    print(countrycode + phonenumber);
                                    this.phoneNo = countrycode + phonenumber;
                                    print(phoneNo);
                                    print(this.phoneNo);
                                    verifyPhone();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      controller: _code,
                      decoration: InputDecoration(
                        errorText:
                            _codeValidate ? 'Value Can\'t Be Empty' : null,
                        border: OutlineInputBorder(
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
                        labelText: 'Enter Code',
                      ),
                      onChanged: (value) {
                        this.smsOTP = value;
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: BottomButton(
                    buttonTitle: 'Register',
                    tapping: () {
                      setState(() {
                        _code.text.isEmpty
                            ? _codeValidate = true
                            : _codeValidate = false;
                      });
                      print(_codeValidate);
                      print(_code.text);
                      if (!_codeValidate) {
                        signIn();
                      }
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
