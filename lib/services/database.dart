import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tennis_event/Models/court.dart';
import 'package:tennis_event/Models/user.dart';
import 'package:tennis_event/models/game.dart';

class DatabaseService {
  final String userId;

  DatabaseService({this.userId});

  //collection reference
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection("users");

  final CollectionReference _gamesCollectionReference =
      Firestore.instance.collection("games");

  final CollectionReference _courtsCollectionReference =
      Firestore.instance.collection("courts");

  Future<Court> createCourt(Court court) async {
    try {
      await _courtsCollectionReference.add(court.toJson()).then(
            (value) => {
              _courtsCollectionReference
                  .document(value.documentID)
                  .updateData({"id": value.documentID})
            },
          );
      return court;
    } catch (e) {
      print(e.message);
    }
  }

  Future<Game> createGame(Game game) async {
    try {
      await _gamesCollectionReference.add(game.toJson()).then(
            (value) => {
              _gamesCollectionReference
                  .document(value.documentID)
                  .updateData({"id": value.documentID})
            },
          );
      return game;
    } catch (e) {
      print(e.message);
    }
  }

  Future<User> createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
      return user;
    } catch (e) {
      print(e.message);
    }
  }

  Future uploadImage(String fileName, File _image) async {
    final StorageReference storageReference =
        FirebaseStorage.instance.ref().child(fileName);
    final StorageUploadTask storageUploadTask =
        storageReference.putFile(_image);
    final StorageTaskSnapshot storageTaskSnapshot =
        await storageUploadTask.onComplete;
    return await storageReference.getDownloadURL();
  }

  Stream<User> get userData {
    return _usersCollectionReference
        .document(userId)
        .snapshots()
        .map((snapshot) => User.fromSnapshot(snapshot));
  }
}
