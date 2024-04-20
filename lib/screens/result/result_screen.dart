import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/data/models/scaner_model.dart';
import 'package:homework/utils/app_colors.dart';
import 'package:homework/utils/size_utils.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.scannerModel});

  final ScannerModel scannerModel;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.c_333333.withOpacity(.84),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 46.w, vertical: 38.h),
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    padding:
                        EdgeInsets.only(left: 14.w, top: 12.h, bottom: 12.h),
                    backgroundColor: AppColors.black.withOpacity(.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.c_FDB623,
                    size: 30.sp,
                  ),
                ),
                25.getW(),
                Text(
                  "Result",
                  style: TextStyle(
                    color: AppColors.c_D9D9D9,
                    fontSize: 27.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            35.getH(),
            Container(
              height: 300.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 19.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.black.withOpacity(.25),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.qr_code_scanner_outlined,
                        size: 50.sp,
                        color: AppColors.white,
                      ),
                      16.getW(),
                      Text(
                        widget.scannerModel.name,
                        style: TextStyle(
                          color: AppColors.c_D9D9D9,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  21.getH(),
                  Container(
                    width: double.infinity,
                    height: 1.h,
                    color: const Color(0xFF858585),
                  ),
                  7.getH(),
                  Text(
                    widget.scannerModel.qrCode,
                    style: TextStyle(
                      color: AppColors.c_D9D9D9,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  13.getH(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Show QR Code",
                      style: TextStyle(
                        color: AppColors.c_FDB623,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
