import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/screens/homework1/widgets/app_bar.dart';
import 'package:homework/screens/homework1/widgets/row_items.dart';
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
              expandedHeight: 220.h,
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
                            width: 360.w,
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
            SliverPersistentHeader(
              delegate: CategoriesView(
                onTap: () {},
              ),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 250.h,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...List.generate(
                      3,
                      (index) => Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 24.w),
                            padding: EdgeInsets.only(top: 70.h),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 16.w,
                              ),
                              margin: EdgeInsets.only(
                                top: 20.h,
                                left: 24.w,
                                right: 24.w,
                              ),
                              width: double.infinity,
                              height: 250.h,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                    color: Colors.orangeAccent, width: 1.w),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(16.r),
                                        bottomRight: Radius.circular(16.r),
                                      ),
                                      child: Image.asset(
                                        AppImages.banner,
                                        height: 250.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          20.getH(),
                                          Text(
                                            "#SimpleKitchen",
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          28.getH(),
                                          Text(
                                            "Soup\nPackage",
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 24.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          5.getH(),
                                          Text(
                                            "No need to think about ingredients anymore,\nlet's find your menu today",
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 6.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -17.h,
                            right: 20.w,
                            child: Image.asset(AppImages.soup),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  10.getH(),
                  RowItems(
                    text: "Best Price",
                    onTap: () {},
                  ),
                  20.getH(),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(left: 16.w, right: 16.w),
                    child: TextButton(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 9.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF2F2F2),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Image.asset(AppImages.vegetables),
                          ),
                          10.getH(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Text(
                              "Tempe",
                              style: TextStyle(
                                color: const Color(0xFF3D3014),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              children: [
                                Text(
                                  "1 Package 500 Ons",
                                  style: TextStyle(
                                    color: const Color(0xFF3D3014),
                                    fontSize: 6.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "Rp. 20.000",
                                  style: TextStyle(
                                    color: const Color(0xFF3D3014),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
                childAspectRatio: 0.80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
