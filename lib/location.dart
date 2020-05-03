import 'package:geolocator/geolocator.dart';

class Location {

  final Geolocator _geolocator = Geolocator();

  double latitude;
  double longitude;

  Future getCurrentLocation() async {
    try {
      var position = await _geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}