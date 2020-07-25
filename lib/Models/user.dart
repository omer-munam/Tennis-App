import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String userName;
  String gender;
  String yearOfBirth;
  String playLevel;
  String side;
  int phoneNumber;
  String image;
  String cCode;

  User(this.userName, this.gender, this.yearOfBirth, this.playLevel, this.side,
      this.phoneNumber, this.image, this.cCode);

  User.fromSnapshot(DocumentSnapshot snapshot) {
    userName = snapshot.data['userName'];
    gender = snapshot.data['gender'];
    yearOfBirth = snapshot.data['yearOfBirth'];
    playLevel = snapshot.data['playLevel'];
    side = snapshot.data['side'];
    phoneNumber = snapshot.data['phoneNumber'];
    image = snapshot.data['image'];
    cCode = snapshot.data['cCode'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'gender': gender,
      'yearOfBirth': yearOfBirth,
      'playLevel': playLevel,
      'side': side,
      'phoneNumber': phoneNumber,
      'image': image,
      'countryCode': cCode,
    };
  }
}
