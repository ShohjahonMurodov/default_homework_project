import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/utils/size_utils.dart';

class HistoryItems extends StatelessWidget {
  const HistoryItems({super.key, required this.title, required this.image, required this.onTap});

  final String title;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: Image.network(
                  image,
                  width: 65.w,
                  height: 65.h,
                  fit: BoxFit.cover,
                ),
              ),
              9.getH(),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        30.getW(),
      ],
    );
  }
}
