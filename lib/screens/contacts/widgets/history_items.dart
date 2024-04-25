import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/utils/size_utils.dart';

class HistoryItems extends StatelessWidget {
  const HistoryItems({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.w),
      width: 56.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.r),
              border: Border.all(
                width: 2.w,
                color: const Color(0xFFD84D4D),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.r),
              child: Image.network(
                "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?cs=srgb&dl=pexels-italo-melo-881954-2379004.jpg&fm=jpg",
                width: 48.w,
                height: 48.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          4.getH(),
          Text(
            textAlign: TextAlign.center,
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: const Color(0xFF0F1828),
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
