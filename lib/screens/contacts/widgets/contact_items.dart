import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/size_utils.dart';

class ContactItems extends StatelessWidget {
  const ContactItems({
    super.key,
    required this.name,
    required this.isOnline,
    required this.onTap,
    required this.image,
  });

  final String name;
  final bool isOnline;
  final String image;
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
              ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: CachedNetworkImage(
                  imageUrl: image,
                  width: 51.w,
                  height: 51.h,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (_, url, download) {
                    if (download.progress != null) {
                      final percent = download.progress! * 100;
                      return Text('$percent done loading');
                    }
                    return Text('Loading $url');
                  },
                ),
              ),
              19.getW(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  2.getH(),
                  Text(
                    isOnline ? "ONLINE" : "OFFLINE",
                    style: TextStyle(
                      color: isOnline ? Colors.green : const Color(0xFFB3B9C9),
                      fontSize: 14.sp,
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
