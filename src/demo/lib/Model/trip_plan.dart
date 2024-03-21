import 'package:demo/Model/coordinates.dart';
import 'package:demo/Model/hiker.dart';

class TripPlan {
  late String emergencyContact;
  late String emergencyServices;
  late DateTime estimatedToCompleteAt;
  late Coordinates locationStart;
  late Coordinates locationEnd;
  late List<Hiker> otherHikers;

  TripPlan(this.emergencyContact, this.emergencyServices, this.estimatedToCompleteAt, this.locationStart, this.locationEnd, this.otherHikers);

  void addHiker(Hiker hiker) {
    otherHikers.add(hiker);
  }

  void sendPlan() {
    // Implement sendPlan functionality
  }

  void finishHike() {
    // Implement finishHike functionality
  }
}