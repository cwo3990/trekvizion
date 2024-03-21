import 'package:demo/Model/coordinates.dart';
// import 'package:flutter_test/flutter_test.dart';
import 'package:test/test.dart';

void main() {
  group('Coordinates tests', () {
    test('Coordinates constructor', () {
      final coordinates = Coordinates(40.7128, -74.0060);

      expect(coordinates.latitude, 40.7128);
      expect(coordinates.longitude, -74.0060);
    });
  });
}
