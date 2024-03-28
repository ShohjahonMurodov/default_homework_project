import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homework/screens/map/widgets/map_type_item.dart';
import 'package:homework/utils/app_images.dart';
import 'package:homework/utils/size_utils.dart';
import 'package:homework/views/maps_view/maps_view_model.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late String icon;

  @override
  Widget build(BuildContext context) {
    CameraPosition? cameraPosition;

    return Scaffold(
      body: Consumer<MapsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.initialCameraPosition == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Stack(
            children: [
              GoogleMap(
                markers: viewModel.markers,
                onCameraIdle: () {
                  if (cameraPosition != null) {
                    context
                        .read<MapsViewModel>()
                        .changeCurrentLocation(cameraPosition!);
                    context.read<MapsViewModel>().addNewMarker(icon: icon);
                  }
                },
                onCameraMove: (CameraPosition currentCameraPosition) {
                  cameraPosition = currentCameraPosition;
                  debugPrint(
                      "CURRENT POSITION: ${currentCameraPosition.target.longitude}");
                },
                mapType: viewModel.mapType,
                initialCameraPosition: viewModel.initialCameraPosition!,
                onMapCreated: (GoogleMapController googleMapController) {
                  viewModel.controller.complete(googleMapController);
                },
              ),
              const Align(
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 50,
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 64.w,
            height: 64.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.25),
                  offset: Offset(0.w, 4.h),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                context.read<MapsViewModel>().moveToInitialPosition();
              },
              child: Icon(
                Icons.gps_fixed,
                color: Colors.black.withOpacity(.9),
                size: 30,
              ),
            ),
          ),
          10.getH(),
          MapTypeItem(
            onTap1: () {
              context.read<MapsViewModel>().changeMapType(MapType.normal);
            },
            onTap2: () {
              context.read<MapsViewModel>().changeMapType(MapType.hybrid);
            },
            onTap3: () {
              context.read<MapsViewModel>().changeMapType(MapType.satellite);
            },
            isCategory: false,
          ),
          10.getH(),
          MapTypeItem(
            onTap1: () {
              icon = AppImages.work;
              setState(() {});
            },
            onTap2: () {
              icon = AppImages.home;
              setState(() {});
            },
            onTap3: () {
              icon = AppImages.location;
              setState(() {});
            },
            isCategory: true,
          ),
        ],
      ),
    );
  }
}
