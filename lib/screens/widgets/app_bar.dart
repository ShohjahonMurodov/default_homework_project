// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:homework/utils/app_colors.dart';
// import 'package:homework/utils/size_utils.dart';
//
// class CategoriesView extends SliverPersistentHeaderDelegate {
//   final VoidCallback onTap;
//
//   CategoriesView({required this.onTap});
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     width = MediaQuery.of(context).size.width;
//     height = MediaQuery.of(context).size.height;
//
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 24.w),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text.rich(
//                     TextSpan(
//                       text: "Hello, ",
//                       style: TextStyle(
//                         color: AppColors.c_3E3015,
//                         fontSize: 15.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                       children: [
//                         TextSpan(
//                           text: "Fahmi",
//                           style: TextStyle(
//                             color: AppColors.c_EDA54D,
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   10.getH(),
//                   Text(
//                     "Find The Right One For\nA Healthy Body",
//                     style: TextStyle(
//                       color: AppColors.c_EFBB4E,
//                       fontSize: 20.sp,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//               const Spacer(),
//               TextButton(
//                 style: TextButton.styleFrom(
//                   padding: EdgeInsets.symmetric(
//                     vertical: 25.h,
//                   ),
//                   backgroundColor: AppColors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16.r),
//                   ),
//                   side: BorderSide(
//                     color: AppColors.c_EFBB4E,
//                     width: 1.w,
//                   ),
//                 ),
//                 onPressed: () {},
//                 child: const Icon(
//                   Icons.volume_up_rounded,
//                   color: AppColors.c_EFBB4E,
//                 ),
//               ),
//             ],
//           ),
//           20.getH(),
//           Row(
//             children: [
//               TextField(
//                 style: TextStyle(
//                   color: AppColors.c_E5E1D6,
//                   fontSize: 15.sp,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 decoration: InputDecoration(
//                   prefixIcon: IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.search,
//                       color: AppColors.c_E5E1D6,
//                     ),
//                   ),
//                   hintText: "Search",
//                   hintStyle: TextStyle(
//                     color: AppColors.c_E5E1D6,
//                     fontSize: 15.sp,
//                     fontWeight: FontWeight.w400,
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16.r),
//                     borderSide: BorderSide(
//                       color: AppColors.c_EFBB4E,
//                       width: 1.w,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16.r),
//                     borderSide: BorderSide(
//                       color: AppColors.c_EFBB4E,
//                       width: 1.w,
//                     ),
//                   ),
//                 ),
//               ),
//               20.getH(),
//               TextButton(
//                 style: TextButton.styleFrom(
//                   backgroundColor: AppColors.c_FCF9E8,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16.r),
//                   ),
//                 ),
//                 onPressed: () {},
//                 child: const Icon(
//                   Icons.filter_vintage_sharp,
//                   color: AppColors.c_EEBB4D,
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
//   @override
//   double get maxExtent => 300.0;
//
//   @override
//   double get minExtent => 300.0;
//
//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }
