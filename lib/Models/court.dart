import 'package:cloud_firestore/cloud_firestore.dart';

class Court {
  String id;
  String courtname;
  String street;
  String postalcode;
  String country;
  String city;
  String telephone;
  String email;
  int capacity;

  Court(
      {this.id,
      this.courtname,
      this.street,
      this.postalcode,
      this.country,
      this.city,
      this.telephone,
      this.email,
      this.capacity});

  Court.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.data['id'];
    country = snapshot.data['country'];
    courtname = snapshot.data['courtname'];
    street = snapshot.data['street'];
    postalcode = snapshot.data['postalcode'];
    city = snapshot.data['city'];
    telephone = snapshot.data['telephone'];
    email = snapshot.data['email'];
    capacity = snapshot.data['capacity'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'country': country,
      'courtname': courtname,
      'street': street,
      'postalcode': postalcode,
      'city': city,
      'telephone': telephone,
      'email': email,
      'capacity': capacity
    };
  }
}
