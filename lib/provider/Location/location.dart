import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:location/location.dart';




import '../../Helper/Location/location.dart';
import '../../Http/location.dart';
import '../../Model/currentlocation.dart';
import '../../Model/nearbyplace.dart';


class Locationprovider extends ChangeNotifier {
  // Location location = Location();
  double distance = 0.0;

  Future locationenablecheck() async {
    await LocationHelper().locationpermissioncheck();
  }

  LocationData? currentlocationData;

  Nearbyplace? nearbylocation;

  Future getcurrectlocation() async {
    currentlocationData = await LocationHelper().getLocation();
    print(currentlocationData!.latitude);
    print(currentlocationData!.longitude);
    nearbylocation = await HttpLocation().getnearlocation();
    // listenLocation();
    notifyListeners();
  }

  // stream location

  StreamSubscription<LocationData>? _locationSubscription;
  String? _error;

  // Future<void> listenLocation() async {
  //   _locationSubscription =
  //       location.onLocationChanged.handleError((dynamic err) {
  //     if (err is PlatformException) {
  //       _error = err.code;
  //     }
  //     _locationSubscription?.cancel();
  //     _locationSubscription = null;
  //   }).listen((LocationData currentLocation) async {
  //     _error = null;
  //     currentlocationData = currentLocation;

  //     await location.changeNotificationOptions(
  //         subtitle:
  //             'Location: ${currentLocation.latitude}, ${currentLocation.longitude}',
  //         onTapBringToFront: true);
  //   });
  // }

  Future<void> stopListen() async {
    await _locationSubscription?.cancel();
    _locationSubscription = null;
    notifyListeners();
  }

  // calculate distance

  calculateDistance({lat1, lon1, lat2, lon2}) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    distance = 12742 * asin(sqrt(a));
    print(distance);
    notifyListeners();
  }

  @override
  void dispose() {
    print("dispose");
    _locationSubscription!.cancel();
    _locationSubscription = null;
    super.dispose();
  }
}
