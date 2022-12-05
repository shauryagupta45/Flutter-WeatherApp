// import 'dart:developer';

import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';
// import 'city_screen.dart';

const apiKey = '4e378dbfc5ffe22825f870abedf84dab';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // WeatherModel weatherModel = WeatherModel();

    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

// now the use of async programming is , generally these calls, take long time , like to get the information, of location and various stuff, and giving back to the app, but async programming helps us to run these kind of processes in background instead of foreground and saves blocking of UI or freezing up of app .

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white60,
          size: 100.0,
        ),
      ),
    );
  }
}
