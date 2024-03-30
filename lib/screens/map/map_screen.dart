import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homework/data/models/place/place_model.dart';
import 'package:homework/screens/map/widgets/map_type_item.dart';
import 'package:homework/utils/app_images.dart';
import 'package:homework/utils/size_utils.dart';
import 'package:homework/views/maps_view/maps_view_model.dart';
import 'package:homework/views/place_view/place_view_model.dart';
import 'package:lottie/lottie.dart';
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

    return SafeArea(
      child: Scaffold(
        body: Consumer<MapsViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.initialCameraPosition == null) {
              return Center(
                child: Lottie.asset(AppImages.map),
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
                Positioned(
                  top: 100.h,
                  right: 0,
                  left: 0,
                  child: Text(
                    textAlign: TextAlign.center,
                    viewModel.currentPlaceName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Positioned(
                  top: 150.h,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      context.read<MapsViewModel>().moveToInitialPosition();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          bottomLeft: Radius.circular(30.r),
                        ),
                      ),
                      child: const Icon(
                        Icons.gps_fixed,
                        size: 40,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.h,
                      horizontal: 15.w,
                    ),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.25),
                          offset: Offset(0.w, 4.h),
                          blurRadius: 4,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 35,
                          ),
                        ),
                        Text(
                          "Save new address",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 24.w,
                      right: 70.w,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                      ),
                      onPressed: () async {
                        await context.read<PlaceViewModel>().insertProducts(
                              PlaceModel(
                                docId: "",
                                latLng: context
                                    .read<MapsViewModel>()
                                    .currentCameraPosition
                                    .target
                                    .latitude,
                                latLong: context
                                    .read<MapsViewModel>()
                                    .currentCameraPosition
                                    .target
                                    .longitude,
                                entrance: "",
                                flatNumber: "",
                                orientAddress: "",
                                placeName: context
                                    .read<MapsViewModel>()
                                    .currentPlaceName,
                                stage: "",
                                placeCategory: icon,
                              ),
                              context,
                            );
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
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
      ),
    );
  }
}
