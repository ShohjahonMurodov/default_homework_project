import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/cubit/to_check/check_cubit.dart';
import 'package:homework/utils/size_utils.dart';

class EnterScreen extends StatefulWidget {
  const EnterScreen({super.key});

  @override
  State<EnterScreen> createState() => _EnterScreenState();
}

class _EnterScreenState extends State<EnterScreen> {
  String pinCode = "";

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    Widget buttonItems({required String title}) {
      return TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 33.w,
            vertical: 25.h,
          ),
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r),
          ),
        ),
        onPressed: () {
          pinCode += title;
          if (pinCode.length == 4) {
            context.read<CheckCubit>().toCheckPinCode(pinCode, context);
            pinCode = "";
          }
        },
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return BlocBuilder<CheckCubit, String>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                70.getH(),
                Center(
                  child: Text(
                    "Security screen",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                50.getH(),
                Center(
                  child: Text(
                    "Enter your passcode",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                25.getH(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      4,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 12.w),
                        width: 15.w,
                        height: 15.h,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
                80.getH(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buttonItems(title: "1"),
                    buttonItems(title: "2"),
                    buttonItems(title: "3"),
                  ],
                ),
                15.getH(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buttonItems(title: "4"),
                    buttonItems(title: "5"),
                    buttonItems(title: "6"),
                  ],
                ),
                15.getH(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buttonItems(title: "7"),
                    buttonItems(title: "8"),
                    buttonItems(title: "9"),
                  ],
                ),
                15.getH(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 33.w,
                          vertical: 25.h,
                        ),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    buttonItems(title: "0"),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 20.h,
                        ),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      ),
                      onPressed: () {},
                      child: const Icon(
                        Icons.cancel_presentation,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Center(
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                50.getH(),
              ],
            ),
          ),
        );
      },
    );
  }
}
