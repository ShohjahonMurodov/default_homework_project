import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageItems extends StatelessWidget {
  const ImageItems({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w, bottom: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          width: 10.w,
          color: Colors.white,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.r),
        child: Image.network(
          image,
          width: 150.w,
          height: 150.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
