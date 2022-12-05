// import 'dart:async';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      await Geolocator.requestPermission();

      LocationPermission permission = await Geolocator.checkPermission();

      // if (permission == LocationPermission.whileInUse ||
      //     permission == LocationPermission.always) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      // Position position = await Geolocator.getCurrentPosition(
      //     desiredAccuracy: LocationAccuracy.low);

      {
        latitude = position.latitude;
        longitude = position.longitude;
      }
      // these low and high tells us ki kis level ki accuracy chahiye location mei, for weather we dont need the pin point waali location accuracy, but for gps, we'll have to use "bestfornavigation "  waali frequency
      // } else {
      //   if (permission == LocationPermission.deniedForever) {
      //     print(
      //         'Permission is denied forever, you\'ll have to change it in the setting ');
      //     await Geolocator.openAppSettings();
      //     await Geolocator.openLocationSettings();
      //   } else {
      //     print('Permission is denied');
      //   }
      // }
    } //try
    catch (e) {
      print(e);
    }
  }
}
