import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homework/data/local/local_variables.dart';
import 'package:homework/data/models/place/place_model.dart';
import 'package:homework/screens/map/widgets/map_type_item.dart';
import 'package:homework/services/local_notification_services.dart';
import 'package:homework/utils/app_images.dart';
import 'package:homework/utils/size_utils.dart';
import 'package:homework/views/place_view/place_view_model.dart';
import 'package:homework/views/update_view/update_view_model.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class UpdateMapScreen extends StatefulWidget {
  const UpdateMapScreen({super.key, required this.placeModel});

  final PlaceModel placeModel;

  @override
  State<UpdateMapScreen> createState() => _UpdateMapScreenState();
}

class _UpdateMapScreenState extends State<UpdateMapScreen> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController enterController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController apartmentController = TextEditingController();
  final TextEditingController orienterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CameraPosition? cameraPosition;

    return Scaffold(
      body: Consumer<UpdateViewModel>(
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
                        .read<UpdateViewModel>()
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
                top: 60.h,
                left: 18.w,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 13.h,
                    ),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                right: 15.w,
                top: 430.h,
                child: Container(
                  width: 48.w,
                  height: 48.h,
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
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          addressController.text = viewModel.currentPlaceName;
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24.w,
                                vertical: 16.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  topRight: Radius.circular(20.r),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: addressController,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: InputDecoration(
                                      label: Text(
                                        "Current address",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  10.getH(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 90.w,
                                        child: TextField(
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          controller: enterController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: "Enter",
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 90.w,
                                        child: TextField(
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          controller: floorController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: "Floor",
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 90.w,
                                        child: TextField(
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          controller: apartmentController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: "Apartment",
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  10.getH(),
                                  TextField(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    controller: orienterController,
                                    decoration: InputDecoration(
                                      hintText: "Designated location",
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  10.getH(),
                                  SizedBox(
                                    width: double.infinity,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12.h),
                                        backgroundColor: Colors.amber,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                      ),
                                      onPressed: () async {
                                        if (cameraPosition != null) {
                                          context
                                              .read<UpdateViewModel>()
                                              .changeCurrentLocation(
                                                  cameraPosition!);
                                          context
                                              .read<UpdateViewModel>()
                                              .addNewMarker(
                                                icon: widget
                                                    .placeModel.placeCategory,
                                                title: "",
                                                snippet: "",
                                              );
                                        }
                                        await context
                                            .read<PlaceViewModel>()
                                            .updateProduct(
                                              PlaceModel(
                                                placeCategory: widget
                                                    .placeModel.placeCategory,
                                                latLng: cameraPosition!
                                                    .target.latitude,
                                                placeName:
                                                    addressController.text,
                                                entrance: floorController.text,
                                                flatNumber:
                                                    apartmentController.text,
                                                orientAddress:
                                                    orienterController.text,
                                                stage: enterController.text,
                                                docId: widget.placeModel.docId,
                                                latLong: cameraPosition!
                                                    .target.longitude,
                                              ),
                                              context,
                                            );
                                        LocalNotificationService
                                            .localNotificationService
                                            .showNotification(
                                          title: "Address update qilindi!",
                                          body: "Batafsil malumot olish uchun!",
                                          id: idContLocal,
                                        );
                                        idContLocal++;
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
                    child: Icon(
                      Icons.send_sharp,
                      color: Colors.black.withOpacity(.9),
                      size: 30,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 370.h,
                right: 15.w,
                child: MapTypeItem(
                  onTap1: () {
                    context
                        .read<UpdateViewModel>()
                        .changeMapType(MapType.normal);
                  },
                  onTap2: () {
                    context
                        .read<UpdateViewModel>()
                        .changeMapType(MapType.hybrid);
                  },
                  onTap3: () {
                    context
                        .read<UpdateViewModel>()
                        .changeMapType(MapType.satellite);
                  },
                  isCategory: false,
                ),
              ),
              Align(
                child: Image.asset(
                  widget.placeModel.placeCategory,
                  width: 50.w,
                  height: 50.h,
                ),
              ),
              Positioned(
                top: 120.h,
                right: 0,
                left: 0,
                child: Text(
                  textAlign: TextAlign.center,
                  viewModel.currentPlaceName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
