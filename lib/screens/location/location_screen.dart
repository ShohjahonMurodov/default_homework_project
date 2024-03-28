import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homework/screens/map/map_screen.dart';
import 'package:homework/services/local_notification_services.dart';
import 'package:homework/utils/app_images.dart';
import 'package:homework/utils/size_utils.dart';
import 'package:homework/views/location_view/location_view_model.dart';
import 'package:homework/views/maps_view/maps_view_model.dart';
import 'package:provider/provider.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    context.read<LocationViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xFF2A323E),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          65.getH(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppImages.menu,
              ),
            ),
          ),
          Image.asset(AppImages.pictures),
          42.getH(),
          Center(
            child: Text(
              "Tracking In Progress",
              style: TextStyle(
                color: Colors.white.withOpacity(.9),
                fontSize: 30.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Center(
            child: Text(
              "Your Package is on its way!!!",
              style: TextStyle(
                color: Colors.white.withOpacity(.6),
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          40.getH(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 52.w),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  backgroundColor: const Color(0xFF35B2E6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
                onPressed: () {
                  LatLng? latLng = context.read<LocationViewModel>().latLng;
                  if (latLng != null) {
                    Provider.of<MapsViewModel>(context, listen: false)
                        .setLatInitialLong(latLng);
                    LocalNotificationService().showNotification(
                      title: "Attention!",
                      body: "Coordinate: $latLng",
                      id: DateTime.now().millisecond,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const MapScreen();
                        },
                      ),
                    );
                  }
                },
                child: Text(
                  "Track Order",
                  style: TextStyle(
                    color: Colors.white.withOpacity(.9),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
