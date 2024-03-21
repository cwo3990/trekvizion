import 'package:demo/Model/coordinates.dart';
import 'package:demo/Model/hike_review.dart';
import 'package:demo/Model/hike_state.dart';
import 'package:demo/Model/poi.dart';
import 'package:demo/Model/trip_plan.dart';

class Hike {
    late String hikeID;
    late HikeState hikeState;
    late String mapPhoto;
    late String path; // Assuming path is a JSON string
    late List<POI> pois;
    late TripPlan tripPlan;
    late HikeReview hikeReview;
    late DateTime sunDown;
    late DateTime startTime;
    late DateTime endTime;
    late Coordinates startCoordinates;
    late Coordinates endCoordinates;
    late double avgSpeed;
    late double curSpeed;

    //This is from persistance
    Hike(this.hikeID, this.hikeState, this.mapPhoto, this.path, this.pois, this.tripPlan, this.hikeReview, this.sunDown, this.startTime, this.endTime, this.startCoordinates, this.endCoordinates, this.avgSpeed, this.curSpeed);


    void addPOI(POI poi) {
        pois.add(poi);
    }

    void deletePOI(POI poi) {
        pois.remove(poi);
    }

    void setMap() {
        // Implement setMap functionality
    }

    void editPOI() {
        // Implement editPOI functionality
    }

    void pauseHike() {
        // Implement pauseHike functionality
    }

    void resumeHike() {
        // Implement resumeHike functionality
    }

    void finishHike() {
        // Implement finishHike functionality
    }
}
