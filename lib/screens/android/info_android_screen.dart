import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/screens/android/widgets/button_items.dart';
import 'package:homework/utils/app_colors.dart';
import 'package:homework/utils/size_utils.dart';

class InfoAndroidScreen extends StatefulWidget {
  const InfoAndroidScreen({super.key});

  @override
  State<InfoAndroidScreen> createState() => _InfoAndroidScreenState();
}

class _InfoAndroidScreenState extends State<InfoAndroidScreen> {
  static const platform = MethodChannel("samples.flutter.dev/battery");
  String _batteryLevel = "-";

  String deviceInfo = "";

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<int>("getBatteryLevel");
      batteryLevel = '$result %';
    } on PlatformException catch (error) {
      batteryLevel = "Failed to get battery level: '${error.message}'";
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text("Deafult"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(
              Icons.battery_4_bar_outlined,
              size: 30.sp,
              color: Colors.green,
            ),
            title: Text(
              "Battery level: ",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Text(
              _batteryLevel,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 22.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          20.getH(),
          Center(
            child: Text(
              "About Device",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 26.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          10.getH(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Text(
                  deviceInfo,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          ButtonItems(
            title: "About Device Info",
            onTap: () async {
              DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

              AndroidDeviceInfo androidDeviceInfo =
                  await deviceInfoPlugin.androidInfo;

              setState(() {
                deviceInfo += "ID: ${androidDeviceInfo.id}\n";
                deviceInfo += "VERSION: ${androidDeviceInfo.version.sdkInt}\n";
                deviceInfo += "TYPE: ${androidDeviceInfo.type}\n";
                deviceInfo += "MODEL: ${androidDeviceInfo.model}\n";
                deviceInfo +=
                    "MANUFACTURER: ${androidDeviceInfo.manufacturer}\n";
                deviceInfo +=
                    "SERIAL NUMBER: ${androidDeviceInfo.serialNumber}\n";
                deviceInfo += "DEVICE: ${androidDeviceInfo.device}\n";
              });
            },
          ),
          15.getH(),
          ButtonItems(
            title: "Get Battery Percent",
            onTap: () {
              _getBatteryLevel();
            },
          ),
          20.getH(),
        ],
      ),
    );
  }
}
