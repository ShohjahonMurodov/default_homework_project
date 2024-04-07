import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/blocs/book_bloc.dart';
import 'package:homework/blocs/book_event.dart';
import 'package:homework/data/models/book_models.dart';
import 'package:homework/screens/add/widgets/textfield_items.dart';
import 'package:homework/utils/size_utils.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key, required this.bookModels});

  final BookModels bookModels;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController rateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            60.getH(),
            TextFieldItems(
              controller: priceController,
              hintText: "Enter a new price",
              type: TextInputType.number,
            ),
            TextFieldItems(
              controller: descriptionController,
              hintText: "Enter a new description",
              type: TextInputType.text,
            ),
            TextFieldItems(
              controller: rateController,
              hintText: "Enter a new rate",
              type: TextInputType.number,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: 15.h,
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                onPressed: () {
                  BookModels book = BookModels(
                    description: descriptionController.text,
                    name: widget.bookModels.name,
                    price: double.parse(priceController.text),
                    rate: double.parse(priceController.text),
                    author: widget.bookModels.author,
                  );
                  context
                      .read<BookBloc>()
                      .add(UpdateBookEvent(bookModels: book));
                  Navigator.pop(context);
                },
                child: Text(
                  "Book update",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            30.getH(),
          ],
        ),
      ),
    );
  }
}
