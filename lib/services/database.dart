import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tennis_event/Models/court.dart';
import 'package:tennis_event/Models/user.dart';
import 'package:tennis_event/Models/game.dart';

class DatabaseService {
  final String userId;
  final String courtId;
  final List<String> playerIds;

  DatabaseService({this.userId, this.courtId, this.playerIds, String userid});

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

  Future<bool> checkUser(String uid) async {
    DocumentSnapshot doc = await _usersCollectionReference.document(uid).get();
    if (doc.exists)
      return true;
    else
      return false;
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

  Stream<List<User>> get usersDataForGame {
    return _usersCollectionReference
        .where('id', whereIn: playerIds)
        .snapshots()
        .map(_usersListFromSnapshot);
  }

  Stream<List<User>> get users {
    return _usersCollectionReference.snapshots().map(_usersListFromSnapshot);
  }

  Stream<List<Court>> get courts {
    return _courtsCollectionReference.snapshots().map(_courtsListFromSnapshot);
  }

  Stream<Court> get court {
    return _courtsCollectionReference
        .document(courtId)
        .snapshots()
        .map((snapshot) => Court.fromSnapshot(snapshot));
  }

  Stream<List<Game>> get userGames {
    return _gamesCollectionReference
        .where('organizerId', isEqualTo: userId)
        .snapshots()
        .map(_gamesListFromSnapshot);
  }

  List<User> _usersListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return User(
        id: doc.data['id'],
        userName: doc.data['userName'],
        gender: doc.data['gender'],
        yearOfBirth: doc.data['yearOfBirth'],
        playLevel: doc.data['playLevel'],
        side: doc.data['side'],
        phoneNumber: doc.data['phoneNumber'],
        image: doc.data['image'],
        cCode: doc.data['cCode'],
        points: doc.data['points'],
      );
    }).toList();
  }

  List<Court> _courtsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Court(
        id: doc.data['id'],
        courtname: doc.data['courtname'],
        street: doc.data['street'],
        postalcode: doc.data['postalcode'],
        country: doc.data['country'],
        city: doc.data['city'],
        telephone: doc.data['telephone'],
        email: doc.data['email'],
      );
    }).toList();
  }

  List<Game> _gamesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Game(
        id: doc.data['id'],
        name: doc.data['name'],
        players: List.from(doc
            .data['players']), //TODO: fix exception thrown if players is null
        organizerId: doc.data['organizerId'],
        courtId: doc.data['courtId'],
        type: doc.data['type'],
        currency: doc.data['currency'],
        price: doc.data['price'],
        tournament: doc.data['tournament'],
        booked: doc.data['booked'],
        time: doc.data['time'],
        result: doc.data['result'],
        notes: doc.data['notes'],
      );
    }).toList();
  }
}
