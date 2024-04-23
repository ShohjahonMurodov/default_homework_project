import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/utils/app_colors.dart';
import 'package:homework/utils/size_utils.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
    required this.image,
    required this.bookName,
    required this.newFileLocation,
    required this.onTap,
  });

  final String image;
  final String bookName;
  final String newFileLocation;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18.r),
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.w),
                  child: Image.network(
                    image,
                    width: double.infinity,
                    height: 200.h,
                    fit: BoxFit.cover,
                  ),
                ),
                newFileLocation.isEmpty
                    ? Positioned(
                        top: 70.h,
                        left: 45.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: Colors.grey.withOpacity(.4),
                          ),
                          child: Icon(
                            Icons.download,
                            color: Colors.grey,
                            size: 50.sp,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          5.getH(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Center(
              child: Text(
                bookName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.c_263238,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
