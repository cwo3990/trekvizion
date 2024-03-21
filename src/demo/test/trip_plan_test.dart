import 'package:demo/Model/coordinates.dart';
import 'package:demo/Model/hiker.dart';
import 'package:demo/Model/trip_plan.dart';
// import 'package:flutter_test/flutter_test.dart';
import 'package:test/test.dart';

void main() {
  group('TripPlan tests', () {
    test('Add hiker', () {
      final tripPlan = TripPlan('911', 'EMS', DateTime.now(), Coordinates(0, 0),
          Coordinates(1, 1), []);
      final hiker =
          Hiker('1234', 'John Doe', '123-456-7890', 'path/to/picture.jpg');
      tripPlan.addHiker(hiker);
      expect(tripPlan.otherHikers.length, 1);
    });

    // Write more tests for other TripPlan methods if needed
  });
}
