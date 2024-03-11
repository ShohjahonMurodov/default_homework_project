import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/data/models/category/category_models.dart';
import 'package:homework/screens/widgets/row_items.dart';
import 'package:homework/utils/app_colors.dart';
import 'package:homework/utils/app_images.dart';
import 'package:homework/utils/size_utils.dart';

class CustomScrollViewScreen extends StatefulWidget {
  const CustomScrollViewScreen({super.key});

  @override
  State<CustomScrollViewScreen> createState() => _CustomScrollViewScreenState();
}

class _CustomScrollViewScreenState extends State<CustomScrollViewScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              expandedHeight: 300.h,
              backgroundColor: AppColors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: "Hello, ",
                                  style: TextStyle(
                                    color: AppColors.c_3E3015,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Fahmi",
                                      style: TextStyle(
                                        color: AppColors.c_EDA54D,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              10.getH(),
                              Text(
                                "Find The Right One For\nA Healthy Body",
                                style: TextStyle(
                                  color: AppColors.c_3C3014,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 25.h,
                              ),
                              backgroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              side: BorderSide(
                                color: AppColors.c_EFBB4E,
                                width: 1.w,
                              ),
                            ),
                            onPressed: () {},
                            child: const Icon(
                              Icons.volume_up_rounded,
                              color: AppColors.c_EFBB4E,
                            ),
                          ),
                        ],
                      ),
                      20.getH(),
                      Row(
                        children: [
                          SizedBox(
                            width: 350.w,
                            child: TextField(
                              style: TextStyle(
                                color: AppColors.c_E5E1D6,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.search,
                                    color: AppColors.c_E5E1D6,
                                  ),
                                ),
                                hintText: "Search",
                                hintStyle: TextStyle(
                                  color: AppColors.c_E5E1D6,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                  borderSide: BorderSide(
                                    color: AppColors.c_EFBB4E,
                                    width: 1.w,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                  borderSide: BorderSide(
                                    color: AppColors.c_EFBB4E,
                                    width: 1.w,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          20.getW(),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 25.h),
                              backgroundColor: AppColors.c_FCF9E8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                            ),
                            onPressed: () {},
                            child: const Icon(
                              Icons.filter_vintage_sharp,
                              color: AppColors.c_EEBB4D,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  RowItems(
                    text: "Category",
                    onTap: () {},
                  ),
                  10.getH(),
                  SizedBox(
                    height: 110.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        24.getW(),
                        ...List.generate(
                          dataBase.length,
                          (index) => Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: dataBase[index].color,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Image.asset(
                                    dataBase[index].image,
                                    width: 60.w,
                                  ),
                                ),
                              ),
                              5.getH(),
                              Text(
                                dataBase[index].text,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        12.getW(),
                      ],
                    ),
                  ),
                  20.getH(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      "Best Deal",
                      style: TextStyle(
                        color: AppColors.c_3C3014,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  10.getH(),
                  Container(
                    height: 250.h,
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(16.r),
                      border:
                          Border.all(color: Colors.orangeAccent, width: 1.w),
                    ),
                    child: Image.asset(AppImages.vegetables),
                  ),
                  20.getH(),
                  RowItems(
                    text: "Best Price",
                    onTap: () {},
                  ),
                  10.getH(),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 5.h,
                      ),
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        side: BorderSide(
                          color: AppColors.c_EFBB4E,
                          width: 1.w,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Column(
                      children: [
                        Image.asset(AppImages.vegetables),
                      ],
                    ),
                  ),
                  // SliverGrid(
                  //   delegate: SliverChildBuilderDelegate(
                  //     (BuildContext context, int index) {
                  //       return TextButton(
                  //         style: TextButton.styleFrom(
                  //           padding: EdgeInsets.symmetric(
                  //             horizontal: 5.w,
                  //             vertical: 5.h,
                  //           ),
                  //           backgroundColor: AppColors.white,
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(16.r),
                  //             side: BorderSide(
                  //               color: AppColors.c_EFBB4E,
                  //               width: 1.w,
                  //             ),
                  //           ),
                  //         ),
                  //         onPressed: () {},
                  //         child: Column(
                  //           children: [
                  //             Image.asset(AppImages.vegetables),
                  //           ],
                  //         ),
                  //       );
                  //     },
                  //   ),
                  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 2,
                  //     mainAxisSpacing: 10.h,
                  //     crossAxisSpacing: 10.w,
                  //     childAspectRatio: 1,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
