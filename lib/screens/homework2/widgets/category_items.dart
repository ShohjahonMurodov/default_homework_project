import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/utils/app_images.dart';
import 'package:homework/utils/size_utils.dart';

import '../../../utils/app_colors.dart';

class CategoryItems extends SliverPersistentHeaderDelegate {
  final VoidCallback onTap;

  CategoryItems({required this.onTap});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    int activeIndex = 0;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return StatefulBuilder(builder: (context, setState) {
      return Container(
        color: AppColors.white,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            20.getW(),
            ...List.generate(
              texts.length,
              (index) => Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: activeIndex == index
                          ? AppColors.c_7A7AFD
                          : AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.dot,
                          colorFilter: ColorFilter.mode(
                              activeIndex == index
                                  ? AppColors.c_FCFCFD
                                  : AppColors.c_7F8192,
                              BlendMode.srcIn),
                        ),
                        8.getW(),
                        Text(
                          texts[index],
                          style: TextStyle(
                            color: activeIndex == index
                                ? AppColors.c_FCFCFD
                                : AppColors.c_7F8192,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.getW(),
                ],
              ),
            ),
            20.getW(),
          ],
        ),
      );
    });
  }

  @override
  double get maxExtent => 100.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

List<String> texts = ["Payments", "Food", "Services", "Rent"];
