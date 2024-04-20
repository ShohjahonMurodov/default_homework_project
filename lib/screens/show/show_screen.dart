import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/data/models/scaner_model.dart';
import 'package:homework/services/widget_save_sirvice.dart';
import 'package:homework/utils/app_colors.dart';
import 'package:homework/utils/size_utils.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key, required this.scannerModel});

  final ScannerModel scannerModel;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_333333.withOpacity(0.7),
      body: Column(
        children: [
          40.getH(),
          Row(
            children: [
              SizedBox(width: 20.w),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.c_333333,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 22.sp,
                  color: AppColors.c_FDB623,
                ),
              ),
              25.getW(),
              Text(
                "QR Code",
                style: TextStyle(
                  color: AppColors.c_D9D9D9,
                  fontSize: 27.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          33.getH(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: ListTile(
              onTap: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r)),
              tileColor: AppColors.c_333333,
              title: Text(
                "Data:",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                widget.scannerModel.qrCode,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          55.getH(),
          RepaintBoundary(
            key: _globalKey,
            child: Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () async {
                  Uri uri = Uri.parse(widget.scannerModel.qrCode);
                  await launchUrl(uri);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(color: AppColors.c_FDB623, width: 5.w),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.c_FDB623.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 5),
                    ],
                  ),
                  child: QrImageView(
                    data: widget.scannerModel.qrCode,
                    version: QrVersions.auto,
                    size: 200,
                  ),
                ),
              ),
            ),
          ),
          40.getH(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.w, vertical: 18.h),
                      backgroundColor: AppColors.c_FDB623,
                    ),
                    onPressed: () {
                      WidgetSaverService.openWidgetAsImage(
                        context: context,
                        widgetKey: _globalKey,
                        fileId: widget.scannerModel.qrCode,
                      );
                    },
                    child: Icon(
                      Icons.share,
                      size: 30.sp,
                      color: AppColors.c_333333,
                    ),
                  ),
                  8.getH(),
                  Text(
                    "Share",
                    style: TextStyle(
                      color: AppColors.c_D9D9D9,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              20.getW(),
              Column(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.w, vertical: 18.h),
                      backgroundColor: AppColors.c_FDB623,
                    ),
                    onPressed: () {
                      WidgetSaverService.openWidgetAsImage(
                        context: context,
                        widgetKey: _globalKey,
                        fileId: widget.scannerModel.qrCode,
                      );
                    },
                    child: Icon(
                      Icons.save,
                      size: 30.sp,
                      color: AppColors.c_333333,
                    ),
                  ),
                  8.getH(),
                  Text(
                    "Save",
                    style: TextStyle(
                      color: AppColors.c_D9D9D9,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
