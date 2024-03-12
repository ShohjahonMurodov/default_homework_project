import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/data/models/category/category_models.dart';
import 'package:homework/screens/homework1/widgets/row_items.dart';
import 'package:homework/utils/size_utils.dart';

class CategoriesView extends SliverPersistentHeaderDelegate {
  final VoidCallback onTap;

  CategoriesView({required this.onTap});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
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
        ],
      ),
    );
  }

  @override
  double get maxExtent => 150.0;

  @override
  double get minExtent => 150.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
