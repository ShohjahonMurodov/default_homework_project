import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homework/data/models/place/place_model.dart';
import 'package:homework/screens/map/widgets/map_type_item.dart';
import 'package:homework/utils/size_utils.dart';
import 'package:homework/views/place_view/place_view_model.dart';
import 'package:homework/views/update_view/update_view_model.dart';
import 'package:provider/provider.dart';

class UpdateMapScreen extends StatefulWidget {
  const UpdateMapScreen({super.key, required this.placeModel});

  final PlaceModel placeModel;

  @override
  State<UpdateMapScreen> createState() => _UpdateMapScreenState();
}

class _UpdateMapScreenState extends State<UpdateMapScreen> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController padizController = TextEditingController();
  final TextEditingController etajController = TextEditingController();
  final TextEditingController homeController = TextEditingController();
  final TextEditingController orienterController = TextEditingController();

  String address = "";

  @override
  Widget build(BuildContext context) {
    CameraPosition? cameraPosition;

    return Scaffold(
      body: Consumer<UpdateViewModel>(
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
                  address = viewModel.currentPlaceName;
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
                top: 50.h,
                left: 24.w,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 13.h,
                    ),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      side: BorderSide(
                        color: Colors.black,
                        width: 1.w,
                      ),
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
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  context: context,
                  builder: (BuildContext context) {
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
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              controller: addressController,
                              decoration: InputDecoration(
                                hintText: address,
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
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              controller: padizController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Padizni kiriting",
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
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              controller: etajController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Etajni kiriting",
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
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              controller: homeController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Kvartirani kiriting",
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
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              controller: orienterController,
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
                                  padding: EdgeInsets.symmetric(vertical: 17.h),
                                  backgroundColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                                onPressed: () async {
                                  if (cameraPosition != null) {
                                    context
                                        .read<UpdateViewModel>()
                                        .changeCurrentLocation(cameraPosition!);
                                    context
                                        .read<UpdateViewModel>()
                                        .addNewMarker(
                                          icon: widget.placeModel.placeCategory,
                                          title: "",
                                          snippet: "",
                                        );
                                  }
                                  if (homeController.text.isNotEmpty &&
                                      orienterController.text.isNotEmpty) {
                                    print(
                                        "DOc id: ${widget.placeModel.docId} ------------------------------");
                                    await context
                                        .read<PlaceViewModel>()
                                        .updateProduct(
                                          PlaceModel(
                                            placeCategory:
                                                widget.placeModel.placeCategory,
                                            latLng:
                                                cameraPosition!.target.latitude,
                                            placeName: address,
                                            entrance: etajController.text,
                                            flatNumber: homeController.text,
                                            orientAddress:
                                                orienterController.text,
                                            stage: padizController.text,
                                            docId: widget.placeModel.docId,
                                            latLong: cameraPosition!
                                                .target.longitude,
                                          ),
                                          context,
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
              child: Icon(
                Icons.change_circle,
                color: Colors.black.withOpacity(.9),
                size: 30,
              ),
            ),
          ),
          10.getH(),
          MapTypeItem(
            onTap1: () {
              context.read<UpdateViewModel>().changeMapType(MapType.normal);
            },
            onTap2: () {
              context.read<UpdateViewModel>().changeMapType(MapType.hybrid);
            },
            onTap3: () {
              context.read<UpdateViewModel>().changeMapType(MapType.satellite);
            },
            isCategory: false,
          ),
        ],
      ),
    );
  }
}
