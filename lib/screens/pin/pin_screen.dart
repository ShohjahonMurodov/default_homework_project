import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/cubit/to_check/check_cubit.dart';
import 'package:homework/utils/size_utils.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  String pinCode = "";
  String againCode = "";
  bool isAgain = false;

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
          backgroundColor: Colors.white10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r),
          ),
        ),
        onPressed: () {
          pinCode += title;
          if (isAgain) {
            againCode = pinCode;
          }
          if (pinCode.length == 4) {
            if (!isAgain) {
              context.read<CheckCubit>().createPassword(pinCode);
              pinCode = "";
              isAgain = true;
            }
            context.read<CheckCubit>().toVerifyPinCode(againCode, context);
          }
          setState(() {});
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
          body: Stack(
            children: [
              Positioned(
                top: 100,
                left: -50,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.yellow.withOpacity(0.4),
                          spreadRadius: 40,
                          blurRadius: 100)
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 100,
                left: -50,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.purple.withOpacity(0.4),
                          spreadRadius: 60,
                          blurRadius: 100)
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 150,
                right: -50,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.green.withOpacity(0.4),
                          spreadRadius: 40,
                          blurRadius: 100)
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Padding(
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
                          isAgain
                              ? "Again your password"
                              : "Enter your passcode",
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
                              decoration: BoxDecoration(
                                color: index < pinCode.length
                                    ? Colors.green
                                    : Colors.grey,
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
                                horizontal: 42.w,
                                vertical: 27.h,
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
                                horizontal: 22.w,
                                vertical: 22.h,
                              ),
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                            ),
                            onPressed: () {
                              if (pinCode.isEmpty) {
                                pinCode = "";
                              } else {
                                pinCode =
                                    pinCode.substring(0, pinCode.length - 1);
                              }
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.backspace,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
