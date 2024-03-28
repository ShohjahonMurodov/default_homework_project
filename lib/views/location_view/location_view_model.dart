import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationViewModel extends ChangeNotifier {
  Location location = Location();

  LatLng? latLng;

  LocationViewModel() {
    getUserLocation();
  }

  Future<void> getUserLocation() async {
    bool serviceEnabled = false;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    latLng = LatLng(locationData.latitude!, locationData.longitude!);

    debugPrint("LONGITUDE:${locationData.longitude}");
    debugPrint("LATITUDE:${locationData.latitude}");
    debugPrint("SPEED:${locationData.speed}");
    debugPrint("ALTITUDE:${locationData.altitude}");

    listenCurrentLocation();

    location.enableBackgroundMode(enable: true);
  }

  void listenCurrentLocation() {
    location.onLocationChanged.listen((LocationData locationData) {
      debugPrint("LONGITUDE FROM STREAM:${locationData.longitude}");
      debugPrint("LATITUDE FROM STREAM:${locationData.latitude}");
      debugPrint("SPEED FROM STREAM:${locationData.speed}");
      debugPrint("ALTITUDE FROM STREAM:${locationData.altitude}");
    });
  }
}
