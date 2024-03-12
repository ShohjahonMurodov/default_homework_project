import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/data/models/balances/balance_models.dart';
import 'package:homework/screens/homework2/widgets/balance_items.dart';
import 'package:homework/screens/homework2/widgets/category_items.dart';
import 'package:homework/screens/homework2/widgets/textbutton_items.dart';
import 'package:homework/utils/app_colors.dart';
import 'package:homework/utils/app_images.dart';
import 'package:homework/utils/size_utils.dart';

class BalancaesScreen extends StatefulWidget {
  const BalancaesScreen({super.key});

  @override
  State<BalancaesScreen> createState() => _BalancaesScreenState();
}

class _BalancaesScreenState extends State<BalancaesScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.white,
            expandedHeight: 490.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.c_F5F6FA,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 22.w,
                        right: 22.w,
                        top: 41.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              TextButtonItems(
                                icon: Icons.arrow_back,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              const Spacer(),
                              TextButtonItems(
                                icon: Icons.more_horiz,
                                onTap: () {},
                              ),
                            ],
                          ),
                          32.getH(),
                          Text(
                            "Balances",
                            style: TextStyle(
                              color: AppColors.c_151940,
                              fontSize: 46.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    42.getH(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          22.getW(),
                          ...List.generate(
                            balanceDatabase.length,
                            (index) => BalanceItems(
                              icon: balanceDatabase[index].icon,
                              title: balanceDatabase[index].title,
                              subtitle: balanceDatabase[index].subtitle,
                            ),
                          ),
                          9.getW(),
                        ],
                      ),
                    ),
                    36.getH(),
                    Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "See Balance Details",
                          style: TextStyle(
                            color: AppColors.c_5771F9,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: CategoryItems(
              onTap: () {},
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                42.getW(),
                Text(
                  "Today",
                  style: TextStyle(
                    color: AppColors.c_020000,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                13.getH(),
                ...List.generate(
                  12,
                  (index) => ListTile(
                    onTap: () {},
                    leading: Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 40,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Image.asset(AppImages.pngBehance),
                    ),
                    title: Text(
                      "Behance Project",
                      style: TextStyle(
                        color: AppColors.c_151940,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      "23rd march 2021",
                      style: TextStyle(
                        color: AppColors.c_7F8192,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: Text(
                      "\$320",
                      style: TextStyle(
                        color: AppColors.c_151940,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                13.getH(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
