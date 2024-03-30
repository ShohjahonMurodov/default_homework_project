import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homework/data/api_provider/api_provider.dart';

class UpdateViewModel extends ChangeNotifier {
  final Completer<GoogleMapController> controller =
  Completer<GoogleMapController>();

  String currentPlaceName = "";

  MapType mapType = MapType.normal;

  CameraPosition? initialCameraPosition;
  late CameraPosition currentCameraPosition;

  Set<Marker> markers = {};

  setLatInitialLong(LatLng latLng) {
    initialCameraPosition = CameraPosition(
      target: latLng,
      zoom: 15,
    );

    currentCameraPosition = initialCameraPosition!;
    // addNewMarker(icon: AppImages.location, title: "", snippet: "");
  }

  changeMapType(MapType newMapType) {
    mapType = newMapType;
    notifyListeners();
  }

  moveToInitialPosition() async {
    final GoogleMapController mapController = await controller.future;
    await mapController
        .animateCamera(CameraUpdate.newCameraPosition(initialCameraPosition!));
  }

  changeCurrentCameraPosition(CameraPosition cameraPosition) async {
    final GoogleMapController mapController = await controller.future;
    await mapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  changeCurrentLocation(CameraPosition cameraPosition) async {
    currentCameraPosition = cameraPosition;
    currentPlaceName =
    await ApiProvider.getPlaceNameByLocation(cameraPosition.target);
    notifyListeners();
  }

  addNewMarker(
      {required String icon,
        required String title,
        required String snippet}) async {
    markers = {};
    Uint8List markerImage = await getBytesFromAsset(
      icon,
      150,
    );
    markers.add(
      Marker(
        position: currentCameraPosition.target,
        infoWindow: InfoWindow(title: title, snippet: snippet),
        icon: BitmapDescriptor.fromBytes(markerImage),
        markerId: MarkerId(DateTime.now().toString()),
      ),
    );
    notifyListeners();
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
