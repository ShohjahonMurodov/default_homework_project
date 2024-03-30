import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/utils/app_images.dart';
import 'package:homework/utils/size_utils.dart';

class MapTypeItem extends StatelessWidget {
  const MapTypeItem({
    super.key,
    required this.onTap1,
    required this.onTap2,
    required this.onTap3,
    required this.isCategory,
  });

  final VoidCallback onTap1;
  final VoidCallback onTap2;
  final VoidCallback onTap3;
  final bool isCategory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: Stack(
        children: [
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.25),
                  offset: Offset(0.w, 4.h),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: PopupMenuButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              splashRadius: 50,
              icon: Icon(
                isCategory ? Icons.more_vert : Icons.map,
                color: Colors.black,
                size: 30,
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    onTap: onTap1,
                    child: isCategory
                        ? Center(
                            child: Image.asset(
                              AppImages.work,
                              width: 35.w,
                              height: 35.h,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Center(
                            child: Text(
                              "Normal",
                              style: TextStyle(
                                color: Colors.black.withOpacity(.9),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                  ),
                  PopupMenuItem(
                    onTap: onTap2,
                    child: isCategory
                        ? Center(
                            child: Image.asset(
                              AppImages.home,
                              width: 35.w,
                              height: 35.h,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Center(
                            child: Text(
                              "Hybrid",
                              style: TextStyle(
                                color: Colors.black.withOpacity(.9),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                  ),
                  PopupMenuItem(
                    onTap: onTap3,
                    child: isCategory
                        ? Center(
                            child: Image.asset(
                              AppImages.location,
                              width: 35.w,
                              height: 35.h,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Center(
                            child: Text(
                              "Satellite",
                              style: TextStyle(
                                color: Colors.black.withOpacity(.9),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                  ),
                ];
              },
            ),
          ),
        ],
      ),
    );
  }
}
