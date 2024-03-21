import 'package:demo/Model/hike_review.dart';
// import 'package:flutter_test/flutter_test.dart';
import 'package:test/test.dart';

void main() {
  group('HikeReview tests', () {
    test('HikeReview constructor', () {
      final hikeReview = HikeReview('Hike Title', 'User notes', 5);
      expect(hikeReview.hikeTitle, 'Hike Title');
      expect(hikeReview.userNotes, 'User notes');
      expect(hikeReview.userRating, 5);
    });
  });
}