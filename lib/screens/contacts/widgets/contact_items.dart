import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/size_utils.dart';

class ContactItems extends StatelessWidget {
  const ContactItems({super.key, required this.name, required this.onTap});

  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 16.h),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.network(
                  "https://cdn-icons-png.flaticon.com/512/4086/4086679.png",
                  width: 48.w,
                  height: 48.h,
                  fit: BoxFit.cover,
                ),
              ),
              16.getW(),
              Text(
                name,
                style: TextStyle(
                  color: const Color(0xFF0F1828),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
