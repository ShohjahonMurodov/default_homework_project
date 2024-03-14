import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/data/models/people_models.dart';
import 'package:homework/utils/size_utils.dart';

class PersonButton extends StatelessWidget {
  const PersonButton({super.key, required this.peopleModels});

  final PeopleModels peopleModels;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: Colors.black,
            width: 3.w,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              peopleModels.avatarUrl,
              width: double.infinity,
              height: 100.h,
            ),
            10.getH(),
            Text.rich(
              TextSpan(
                text: "Name: ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: peopleModels.name,
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            5.getH(),
            Text.rich(
              TextSpan(
                text: "Username: ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: peopleModels.userName,
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
