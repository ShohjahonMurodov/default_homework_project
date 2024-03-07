import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/screens/info_coffee_screen/widgets/textbutton_size.dart';
import 'package:homework/utils/app_colors.dart';
import 'package:homework/utils/app_images.dart';
import 'package:homework/utils/size_utils.dart';

class InfoCoffeeScreen extends StatefulWidget {
  const InfoCoffeeScreen({super.key});

  @override
  State<InfoCoffeeScreen> createState() => _InfoCoffeeScreenState();
}

class _InfoCoffeeScreenState extends State<InfoCoffeeScreen> {
  int activeSize = 0;
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_0C0F14,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(
                      AppImages.coffee1,
                      width: double.infinity,
                      height: 544.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.white.withOpacity(.05),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Cappucino",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            SvgPicture.asset(AppImages.star),
                            8.getW(),
                            Text(
                              "4.6 ",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "(1,250)",
                              style: TextStyle(
                                color: AppColors.white.withOpacity(.5),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        4.getH(),
                        Text(
                          "With Chocolate",
                          style: TextStyle(
                            color: AppColors.white.withOpacity(.5),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        16.getH(),
                        Row(
                          children: [
                            Text(
                              "₱ 120.00",
                              style: TextStyle(
                                color: AppColors.c_D17842,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 8.h),
                                backgroundColor: AppColors.c_D17842,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Add to cart",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              24.getH(),
              Text(
                "Description",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              8.getH(),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                style: TextStyle(
                  color: AppColors.white.withOpacity(.25),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Read more",
                  style: TextStyle(
                    color: AppColors.c_D17842,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              24.getH(),
              Text(
                "Size",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              8.getH(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      3,
                      (index) => SizeTextButton(
                        size: sizes[index],
                        onTap: () {
                          setState(() {
                            activeSize = index;
                          });
                        },
                        isSelected: activeSize == index,
                      ),
                    ),
                  ],
                ),
              ),
              40.getH(),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    backgroundColor: AppColors.c_D17842,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Buy now",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              24.getH(),
            ],
          ),
        ),
      ),
    );
  }
}
