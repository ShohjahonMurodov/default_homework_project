import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/utils/app_colors.dart';
import 'package:homework/utils/app_images.dart';
import 'package:homework/utils/size_utils.dart';
import 'package:screenshot/screenshot.dart';

import '../../services/widget_save_service.dart';
import '../../utils/ui_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScreenshotController screenshotController = ScreenshotController();

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.c_E5FDFF,
      appBar: AppBar(
        backgroundColor: AppColors.c_FDFDFD,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppImages.menu),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              String base64Image =
                  await screenshotControllerToString(screenshotController);
              String randomKey = getRandomLetter();
              WidgetSaverService.openWidgetAsImage(
                context: context,
                widgetKey: _globalKey,
                fileId: randomKey,
              );
            },
            icon: SvgPicture.asset(AppImages.pdf),
          ),
        ],
      ),
      body: RepaintBoundary(
        key: _globalKey,
        child: Screenshot(
          controller: screenshotController,
          child: Column(
            children: [
              36.getH(),
              Center(
                child: Image.asset(AppImages.avatar),
              ),
              36.getH(),
              Text(
                textAlign: TextAlign.center,
                "Shohjahon Murodov",
                style: TextStyle(
                  color: AppColors.c_000072,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              16.getH(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Column(
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      "UX/UI Mobile Developer",
                      style: TextStyle(
                        color: AppColors.black.withOpacity(.95),
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    16.getH(),
                    Text(
                      textAlign: TextAlign.center,
                      "+0 years experience",
                      style: TextStyle(
                        color: AppColors.c_000072,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<String> screenshotControllerToString(
    ScreenshotController controller) async {
  Uint8List? imageBytes = await controller.capture();
  String base64Image = base64Encode(imageBytes!);
  return base64Image;
}
