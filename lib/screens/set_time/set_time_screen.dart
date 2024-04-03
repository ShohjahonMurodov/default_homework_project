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

  TimeOfDay? timeOfDay;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 53.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Set Your Time",
              style: TextStyle(
                color: Colors.white,
                fontSize: 45.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            25.getH(),
            Center(
              child: InkWell(
                borderRadius: BorderRadius.circular(100.r),
                onTap: () async {
                  timeOfDay = await showTimePicker(
                    context: context,
                    initialEntryMode: TimePickerEntryMode.input,
                    initialTime: const TimeOfDay(hour: 1, minute: 0),
                    builder: (BuildContext context, Widget? child) {
                      return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(alwaysUse24HourFormat: true),
                        child: child!,
                      );
                    },
                  );
                },
                child: const Icon(
                  Icons.timer,
                  size: 200,
                  color: Colors.white,
                ),
              ),
            ),
            71.getH(),
            TextField(
              controller: tagController,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                labelText: "Tag",
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                ),
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
                  borderSide: BorderSide(color: Colors.white, width: 2.w),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.w),
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
            ),
            4.getH(),
            Text(
              "What you are working on",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            51.getH(),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  backgroundColor: const Color(0xFF00696B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                ),
                onPressed: () {
                  if (timeOfDay != null && tagController.text.isNotEmpty) {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StartTimeScreen(
                          minutes: timeOfDay!.hour * 60 + timeOfDay!.minute,
                          tag: tagController.text,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Biron-bir qismni kiritmadingiz!"),
                      ),
                    );
                  }
                },
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
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
