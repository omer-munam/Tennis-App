import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tennis_event/Models/user.dart';

class DatabaseService {
  final String userId;

  DatabaseService({this.userId});

  //collection reference
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection("users");

  Future<User> createUser(User user) async {
    try {
      await _usersCollectionReference.add(user.toJson()).then((value) => {
            _usersCollectionReference
                .document(value.documentID)
                .updateData({"id": value.documentID})
          });
      return user;
    } catch (e) {
      print(e.message);
    }
  }

  Stream<User> get userData {
    return _usersCollectionReference
        .document(userId)
        .snapshots()
        .map((snapshot) => User.fromSnapshot(snapshot));
  }
}
