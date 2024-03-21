import 'package:demo/Model/coordinates.dart';

class POI {
    late String poiID;
    late Coordinates location;
    late String description;
    late List<String> picturesURL;

    POI(this.poiID, this.location, this.description, this.picturesURL);

    void addPictures(String pictureURL) {
        picturesURL.add(pictureURL);
    }

    void deletePictures() {
        // Implement deletePictures functionality
    }
}