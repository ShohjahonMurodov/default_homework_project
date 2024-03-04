import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/data/models/product_model.dart';
import 'package:homework/data/repositories/app_repositories.dart';
import 'package:homework/screens/edit/widgets/textfiled_edit_items.dart';
import 'package:homework/utils/size_utils.dart';

class EditScreen extends StatefulWidget {
  const EditScreen(
      {super.key,
      required this.text,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.productId});

  final String text;
  final String description;
  final double price;
  final String imageUrl;
  final String productId;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  final AppRepositories appRepositories = AppRepositories();

  @override
  void initState() {
    nameController.value = TextEditingValue(text: widget.text);
    descriptionController.value = TextEditingValue(text: widget.description);
    priceController.value = TextEditingValue(text: widget.price.toString());
    super.initState();
  }

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
                TextFieldEditItems(
                  controller: nameController,
                  hintText: "Product name",
                  type: TextInputType.text,
                ),
                10.getH(),
                TextFieldEditItems(
                  controller: descriptionController,
                  hintText: "Description",
                  type: TextInputType.text,
                ),
                10.getH(),
                TextFieldEditItems(
                  controller: priceController,
                  hintText: "Price",
                  type: TextInputType.number,
                ),
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
                ProductModel productModel = ProductModel(
                  description: descriptionController.text,
                  productName: nameController.text,
                  imageUrl: widget.imageUrl,
                  price: double.parse(priceController.text),
                  productId: widget.productId.toString(),
                );
                await appRepositories.updateProduct(productModel);
                Navigator.pop(context);
                setState(() {});
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
