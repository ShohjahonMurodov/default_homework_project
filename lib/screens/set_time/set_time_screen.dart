import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/screens/start_time/start_time_screen.dart';
import 'package:homework/utils/size_utils.dart';

class SetTimeScreen extends StatefulWidget {
  const SetTimeScreen({super.key});

  @override
  State<SetTimeScreen> createState() => _SetTimeScreenState();
}

class _SetTimeScreenState extends State<SetTimeScreen> {
  final TextEditingController hourController = TextEditingController();
  final TextEditingController minuteController = TextEditingController();
  final TextEditingController tagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 53.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Set Your\nTime",
              style: TextStyle(
                color: Colors.black,
                fontSize: 45.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            25.getH(),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 24.h,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFE3E9E9),
                borderRadius: BorderRadius.circular(28.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter time",
                    style: TextStyle(
                      color: const Color(0xFF3F4949),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  20.getH(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 126.w,
                        child: TextField(
                          maxLength: 2,
                          controller: hourController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 45.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 32.w, vertical: 0.h),
                            hintText: "hour",
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 45.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 3.w,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 3.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        ":",
                        style: TextStyle(
                          color: const Color(0xFF161D1D),
                          fontSize: 57.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 126.w,
                        child: TextField(
                          maxLength: 2,
                          controller: minuteController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 45.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFDDE4E3),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 32.w, vertical: 0.h),
                            hintText: "minute",
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 45.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 3.w,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 3.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  21.getH(),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.access_time),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Ok"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            71.getH(),
            TextField(
              controller: tagController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    tagController.text = "";
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.cancel_outlined,
                    color: Colors.black,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.r),
                    topRight: Radius.circular(4.r),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.r),
                    topRight: Radius.circular(4.r),
                  ),
                ),
              ),
            ),
            Text(
              "What you are working on",
              style: TextStyle(
                color: const Color(0xFF49454F),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            51.getH(),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  backgroundColor: const Color(0xFF00696B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                ),
                onPressed: () {
                  if (hourController.text.isNotEmpty &&
                      minuteController.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StartTimeScreen(
                          minutes: int.parse(hourController.text) * 60 +
                              int.parse(minuteController.text),
                          tag: tagController.text,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Hour yoki minute ni kiritmadingiz :("),
                      ),
                    );
                  }
                },
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
