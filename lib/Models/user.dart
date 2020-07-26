import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String userName;
  String gender;
  String yearOfBirth;
  String playLevel;
  String side;
  String phoneNumber;
  String image;
  String cCode;

  User(
      {this.id,
      this.userName,
      this.gender,
      this.yearOfBirth,
      this.playLevel,
      this.side,
      this.phoneNumber,
      this.image,
      this.cCode});

  User.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.data['id'];
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
      'id': id,
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
