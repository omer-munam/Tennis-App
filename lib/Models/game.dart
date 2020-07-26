import 'package:cloud_firestore/cloud_firestore.dart';

class Game {
  List player = [];
  String organizerId;
  String gameId;
  String gameName;
  String courtLocation;
  String gameType;
  String currency;
  String price;
  bool tournament;
  bool booked;
  DateTime date;
  Timestamp time;
  String organizer;
  String result;

  Game(
      this.player,
      this.organizerId,
      this.gameId,
      this.gameName,
      this.courtLocation,
      this.gameType,
      this.currency,
      this.price,
      this.tournament,
      this.booked,
      this.date,
      this.time,
      this.organizer,
      this.result);

  Game.fromSnapshot(DocumentSnapshot snapshot) {
    player = snapshot.data['player'];
    organizerId = snapshot.data['organizerId'];
    gameId = snapshot.data['gameId'];
    gameName = snapshot.data['gameName'];
    courtLocation = snapshot.data['courtLocation'];
    gameType = snapshot.data['gameType'];
    currency = snapshot.data['currency'];
    price = snapshot.data['price'];
    tournament = snapshot.data['tournament'];
    booked = snapshot.data['booked'];
    date = snapshot.data['date'];
    time = snapshot.data['time'];
    organizer = snapshot.data['organizer'];
    result = snapshot.data['result'];
  }

   Map<String, dynamic> toJson() {
    return {
      'player': player,
      'organizerId': organizerId,
      'gameId': gameId,
      'gameName': gameName,
      'courtLocation': courtLocation,
      'gameType': gameType,
      'currency': currency,
      'price': price,
      'tournament': tournament,
      'booked': booked,
      'date': date,
      'time': time,
      'organizer': organizer,
      'result': result,
    };
  }
}
