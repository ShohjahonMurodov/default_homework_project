import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/screens/contacts/widgets/contact_items.dart';
import 'package:homework/screens/contacts/widgets/history_items.dart';
import 'package:homework/screens/messages/message_screen.dart';
import 'package:homework/utils/app_colors.dart';
import 'package:homework/utils/size_utils.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.getH(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      24.getW(),
                      Container(
                        margin: EdgeInsets.only(right: 16.w),
                        width: 56.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.r),
                                border: Border.all(
                                  width: 2.w,
                                  color: const Color(0xFFADB5BD),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18.r),
                                child: Container(
                                  width: 48.w,
                                  height: 48.h,
                                  color: const Color(0xFFF7F7FC),
                                  child: Icon(
                                    Icons.add,
                                    size: 25.sp,
                                    color: const Color(0xFFADB5BD),
                                  ),
                                ),
                              ),
                            ),
                            4.getH(),
                            Text(
                              textAlign: TextAlign.center,
                              "Your Story",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: const Color(0xFF0F1828),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                      ...List.generate(
                        snapshot.data!.docs.length,
                        (index) {
                          var data = snapshot.data!.docs[index];
                          return HistoryItems(
                            title: data['name'],
                            image: data['image_url'],
                          );
                        },
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
                16.getH(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFFADB5BD),
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: const Color(0xFFADB5BD),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF7F7FC),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: BorderSide(
                          width: 0.w,
                          color: const Color(0xFFF7F7FC),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: BorderSide(
                          width: 0.w,
                          color: const Color(0xFFF7F7FC),
                        ),
                      ),
                    ),
                  ),
                ),
                16.getH(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      ...List.generate(snapshot.data!.docs.length, (index) {
                        var data = snapshot.data!.docs[index];
                        return ContactItems(
                          name: data['name'],
                          image: data['image_url'],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MessageScreen(
                                  name: data['name'],
                                  receiverUserId: data['uuid'],
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
