import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homework/data/models/place/place_model.dart';
import 'package:homework/screens/map/widgets/map_type_item.dart';
import 'package:homework/utils/size_utils.dart';
import 'package:homework/views/update_view/update_view_model.dart';
import 'package:provider/provider.dart';

class UpdateMapScreen extends StatefulWidget {
  const UpdateMapScreen({super.key, required this.placeModel});

  final PlaceModel placeModel;

  @override
  State<UpdateMapScreen> createState() => _UpdateMapScreenState();
}

class _UpdateMapScreenState extends State<UpdateMapScreen> {
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
              // Align(
              //   child: SvgPicture.asset(
              //     widget.placeModel.placeCategory,
              //   ),
              // ),
              Positioned(
                top: 100.h,
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
              // Positioned(
              //   bottom: 0,
              //   child: Column(
              //     children: [],
              //   ),
              // ),
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
              onPressed: () {},
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
