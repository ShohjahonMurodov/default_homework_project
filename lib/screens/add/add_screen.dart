import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/data/models/product_model.dart';
import 'package:homework/data/repositories/app_repositories.dart';
import 'package:homework/screens/add/widgets/textfield_items.dart';
import 'package:homework/utils/size_utils.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  final AppRepositories appRepositories = AppRepositories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          80.getH(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                TextFieldItems(
                    controller: nameController,
                    type: TextInputType.text,
                    hintText: "Product name"),
                10.getH(),
                TextFieldItems(
                    controller: descriptionController,
                    type: TextInputType.text,
                    hintText: "Description"),
                10.getH(),
                TextFieldItems(
                    controller: price,
                    type: TextInputType.number,
                    hintText: "Price"),
                10.getH(),
                TextFieldItems(
                    controller: imageUrlController,
                    type: TextInputType.text,
                    hintText: "Image url"),
              ],
            ),
          ),
          const Spacer(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 10.h),
              ),
              onPressed: () async {
                if (nameController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty &&
                    price.text.isNotEmpty &&
                    imageUrlController.text.isNotEmpty) {
                  ProductModel productModel = ProductModel(
                    description: descriptionController.text,
                    productName: nameController.text,
                    imageUrl: imageUrlController.text,
                    price: double.parse(price.text),
                    productId: "",
                  );
                  await appRepositories.addProducts(productModel);
                  Navigator.pop(context);
                }
              },
              child: Text(
                "Enter",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
