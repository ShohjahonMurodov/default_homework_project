import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/data/models/contact_models.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/size_utils.dart';

class ContactItems extends StatelessWidget {
  const ContactItems(
      {super.key, required this.contactModel, required this.onTap});

  final ContactModel contactModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 16.h),
          child: Row(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.network(
                      contactModel.imageUrl,
                      width: 48.w,
                      height: 48.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  contactModel.isOnline
                      ? Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 12.w,
                            height: 12.h,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(100.r),
                              border: Border.all(
                                width: 2.w,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              16.getW(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${contactModel.contactName} ${contactModel.contactLasName}',
                        style: TextStyle(
                          color: const Color(0xFF0F1828),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "${contactModel.lastOnlineTime.hour}:${contactModel.lastOnlineTime.minute}am",
                        style: TextStyle(
                          color: const Color(0xFFA4A4A4),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  2.getH(),
                  Text(
                    "That’s great, I look forward to hearing",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: const Color(0xFFADB5BD),
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
