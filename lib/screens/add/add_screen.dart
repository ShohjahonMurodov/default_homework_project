import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/blocs/book_bloc.dart';
import 'package:homework/blocs/book_event.dart';
import 'package:homework/data/models/book_models.dart';
import 'package:homework/screens/add/widgets/textfield_items.dart';
import 'package:homework/utils/size_utils.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            60.getH(),
            TextFieldItems(
              controller: nameController,
              type: TextInputType.text,
              hintText: "Enter a name",
            ),
            TextFieldItems(
              controller: authorController,
              type: TextInputType.text,
              hintText: "Enter a author",
            ),
            TextFieldItems(
              controller: priceController,
              type: TextInputType.number,
              hintText: "Enter a price",
            ),
            TextFieldItems(
              controller: rateController,
              type: TextInputType.number,
              hintText: "Enter a rate",
            ),
            TextFieldItems(
              controller: descriptionController,
              type: TextInputType.text,
              hintText: "Enter a description",
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
                  BookModels bookModels = BookModels(
                    description: descriptionController.text,
                    name: nameController.text,
                    price: double.parse(priceController.text),
                    rate: double.parse(rateController.text),
                    author: authorController.text,
                  );
                  context
                      .read<BookBloc>()
                      .add(InsertBookEvent(bookModels: bookModels));
                  Navigator.pop(context);
                },
                child: Text(
                  "Add book",
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
