import 'dart:async';

import 'package:flutter/services.dart';
import 'package:location/location.dart';

class LocationHelper {
  Location location = Location();
  Future locationpermissioncheck() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  Future<LocationData?> getLocation() async {
    try {
      final _locationResult = await location.getLocation();
      return _locationResult;
    } on PlatformException catch (err) {
      print(err.toString());
    }
    return null;
  }


}
