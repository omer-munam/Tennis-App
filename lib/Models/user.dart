class User {
  String userName;
  String gender;
  String yearOfBirth;
  String playLevel;
  String side;
  int phoneNumber;
  String img;
  String cCode;

  User(this.userName, this.gender, this.yearOfBirth, this.playLevel, this.side,
      this.phoneNumber, this.img, this.cCode);

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'gender': gender,
      'yearOfBirth': yearOfBirth,
      'playLevel': playLevel,
      'side': side,
      'phoneNumber': phoneNumber,
      'image': img,
      'countryCode': cCode,
    };
  }
}
