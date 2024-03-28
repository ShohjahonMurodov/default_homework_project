import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

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
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 24.h,
                        ),
                        child: SizedBox(
                          height: 400.h,
                          child: Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Shaharni kiriting",
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.w,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.w,
                                    ),
                                  ),
                                ),
                              ),
                              10.getH(),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Tumanni kiriting",
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.w,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.w,
                                    ),
                                  ),
                                ),
                              ),
                              10.getH(),
                              SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 17.h),
                                    backgroundColor: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (cameraPosition != null) {
                                      context
                                          .read<MapsViewModel>()
                                          .changeCurrentLocation(
                                              cameraPosition!);
                                      context
                                          .read<MapsViewModel>()
                                          .addNewMarker(
                                            icon: icon,
                                            title: titleController.text,
                                            snippet: bodyController.text,
                                          );
                                    }
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
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
