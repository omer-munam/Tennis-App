import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tennis_event/Models/court.dart';
import 'package:tennis_event/Models/user.dart';
import 'package:tennis_event/Models/game.dart';
import 'package:async/async.dart';

class DatabaseService {
  final String userId;
  final String courtId;
  final List<String> playerIds;
  FirebaseAuth _auth = FirebaseAuth.instance;

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

  Future<Game> joinGame(Game game) async {
    try {
      await _gamesCollectionReference.document(game.id).setData(game.toJson());
      return game;
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

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _auth.currentUser();
    return user;
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

  Stream<List<List<Game>>> get userGames {
    Stream<List<Game>> stream1 = _gamesCollectionReference
        .where('players', arrayContains: userId)
        .snapshots()
        .map(_gamesListFromSnapshot);
    Stream<List<Game>> stream2 = _gamesCollectionReference
        .where('organizerId', isEqualTo: userId)
        .snapshots()
        .map(_gamesListFromSnapshot);
    return StreamZip([stream1, stream2]).asBroadcastStream();
  }

  Stream<List<Game>> get games {
    return _gamesCollectionReference.snapshots().map(_gamesListFromSnapshot);
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
        players: List.from(
          doc.data['players'],
        ),
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
        slots: doc.data['slots'],
      );
    }).toList();
  }
}
