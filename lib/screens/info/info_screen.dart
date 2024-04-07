import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/blocs/book_bloc.dart';
import 'package:homework/blocs/book_event.dart';
import 'package:homework/data/models/book_models.dart';
import 'package:homework/screens/edit/edit_screen.dart';
import 'package:homework/utils/size_utils.dart';
import 'package:provider/provider.dart';

class BookInfoScreen extends StatelessWidget {
  const BookInfoScreen({super.key, required this.bookModels});

  final BookModels bookModels;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            56.getH(),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.only(
                  top: 15.h,
                  left: 10.w,
                  bottom: 15.h,
                ),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 30,
              ),
            ),
            60.getH(),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
                width: 176.w,
                height: 264.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    bookModels.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            56.getH(),
            Row(
              children: [
                Text(
                  bookModels.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditScreen(
                          bookModels: bookModels,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    context
                        .read<BookBloc>()
                        .add(DeleteBookEvent(uuid: bookModels.uuid!));
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            8.getH(),
            Text(
              bookModels.author,
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            12.getH(),
            Center(
              child: Text(
                "DESCRIPTION",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            10.getH(),
            Text(
              bookModels.description,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
