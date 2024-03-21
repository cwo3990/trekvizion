import 'package:demo/Model/coordinates.dart';
import 'package:demo/Model/poi.dart';
// import 'package:flutter_test/flutter_test.dart';
import 'package:test/test.dart';


void main() {
  group('POI tests', () {
    test('Add pictures', () {
      final poi = POI('1234', Coordinates(0, 0), 'Description', []);
      poi.addPictures('path/to/picture1.jpg');
      poi.addPictures('path/to/picture2.jpg');
      expect(poi.picturesURL.length, 2);
    });

    // Write more tests for other POI methods if needed
  });
}