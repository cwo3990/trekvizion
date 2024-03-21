import 'package:demo/Model/hiker.dart';
// import 'package:flutter_test/flutter_test.dart';
import 'package:test/test.dart';

void main() {
  group('Hiker tests', () {
    test('Hiker constructor', () {
      final hiker = Hiker('1234', 'John Doe', '123-456-7890', 'path/to/picture.jpg');
      expect(hiker.hikerID, '1234');
      expect(hiker.name, 'John Doe');
      expect(hiker.phone, '123-456-7890');
      expect(hiker.pictureURL, 'path/to/picture.jpg');
    });
  });
}