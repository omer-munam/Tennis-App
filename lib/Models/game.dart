import 'package:cloud_firestore/cloud_firestore.dart';

class Game {
  String id;
  String name;
  List<String> players;
  String organizerId;
  String courtLocation;
  String type;
  String currency;
  int price;
  bool tournament;
  bool booked;
  Timestamp time;
  String result;
  String notes;

  Game({
    this.id,
    this.name,
    this.players,
    this.organizerId,
    this.courtLocation,
    this.type,
    this.currency,
    this.price,
    this.tournament,
    this.booked,
    this.time,
    this.result,
    this.notes,
  });

  Game.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.data['id'];
    name = snapshot.data['name'];
    players = List.from(snapshot.data['players']);
    organizerId = snapshot.data['organizerId'];
    courtLocation = snapshot.data['courtLocation'];
    type = snapshot.data['type'];
    currency = snapshot.data['currency'];
    price = snapshot.data['price'];
    tournament = snapshot.data['tournament'];
    booked = snapshot.data['booked'];
    time = snapshot.data['time'];
    result = snapshot.data['result'];
    notes = snapshot.data['notes'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'players': players,
      'organizerId': organizerId,
      'courtLocation': courtLocation,
      'type': type,
      'currency': currency,
      'price': price,
      'tournament': tournament,
      'booked': booked,
      'time': time,
      'result': result,
      'notes': notes,
    };
  }
}
