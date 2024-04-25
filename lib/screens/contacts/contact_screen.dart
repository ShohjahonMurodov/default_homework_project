import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/data/local/local_variables.dart';
import 'package:homework/screens/contacts/widgets/history_items.dart';
import 'package:homework/utils/app_colors.dart';
import 'package:homework/utils/size_utils.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        title: Text(
          "Conversations",
          style: TextStyle(
            color: const Color(0xFF0F1828),
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.message,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.getH(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                24.getW(),
                ...List.generate(
                  allContacts.length,
                  (index) => HistoryItems(
                    title: allContacts[index].contactName,
                  ),
                ),
              ],
            ),
          ),
          16.getH(),
          Container(
            width: double.infinity,
            height: 1.h,
            color: const Color(0xFFEDEDED),
          ),
        ],
      ),
    );
  }
}
