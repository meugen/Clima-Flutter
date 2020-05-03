import 'package:clima/location.dart';
import 'package:clima/networking.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '1f9fe983de8bd3b1cc7275f014494348';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double _latitude;
  double _longitude;

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('latitude = ${location.latitude}, longitude = ${location.longitude}');
    _latitude = location.latitude;
    _longitude = location.longitude;

    var helper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$_latitude&lon=$_longitude&appid=$apiKey');
    var weatherData = await helper.getData();

    var weatherConditions = weatherData['weather'][0]['id'];
    var temp = weatherData['main']['temp'];
    var name = weatherData['name'];
    print('conditions = $weatherConditions, temp = $temp, name = $name');

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    } ));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
    print('After get location data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        )
      ),
    );
  }
}
