import 'package:cloud_firestore/cloud_firestore.dart';

class Game {
  String id;
  String name;
  List<String> players;
  String organizerId;
  String courtId;
  String type;
  String currency;
  String price;
  bool tournament;
  bool booked;
  Timestamp time;
  String result;
  String notes;
  int numOfPlayers;

  Game({
    this.id,
    this.name,
    this.players,
    this.organizerId,
    this.courtId,
    this.type,
    this.currency,
    this.price,
    this.tournament,
    this.booked,
    this.time,
    this.result,
    this.notes,
    this.numOfPlayers,
  });

  Game.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.data['id'];
    name = snapshot.data['name'];
    players = List.from(snapshot.data['players']);
    organizerId = snapshot.data['organizerId'];
    courtId = snapshot.data['courtId'];
    type = snapshot.data['type'];
    currency = snapshot.data['currency'];
    price = snapshot.data['price'];
    tournament = snapshot.data['tournament'];
    booked = snapshot.data['booked'];
    time = snapshot.data['time'];
    result = snapshot.data['result'];
    notes = snapshot.data['notes'];
    numOfPlayers = snapshot.data['numOfPlayers'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'players': players,
      'organizerId': organizerId,
      'courtId': courtId,
      'type': type,
      'currency': currency,
      'price': price,
      'tournament': tournament,
      'booked': booked,
      'time': time,
      'result': result,
      'notes': notes,
      'numOfPlayers': numOfPlayers,
    };
  }
}
