import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/screens/contacts/widgets/contact_items.dart';
import 'package:homework/screens/contacts/widgets/history_items.dart';
import 'package:homework/screens/messages/message_screen.dart';
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
      backgroundColor: const Color(0xFF1B202D),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      66.getH(),
                      Row(
                        children: [
                          Text(
                            "Messages",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              size: 28.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      9.getH(),
                      Text(
                        "R E C E N T",
                        style: TextStyle(
                          color: Colors.white.withOpacity(.58),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                17.getH(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      25.getW(),
                      ...List.generate(
                        10,
                        (index) {
                          return HistoryItems(
                            title: "Barry",
                            image: snapshot.data!.docs[0]['image_url'],
                            onTap: () {},
                          );
                        },
                      ),
                    ],
                  ),
                ),
                25.getH(),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 10.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFF292F3F),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.r),
                        topRight: Radius.circular(50.r),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          46.getH(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Column(
                              children: [
                                ...List.generate(snapshot.data!.docs.length,
                                    (index) {
                                  var data = snapshot.data!.docs[index];
                                  return ContactItems(
                                    name: data['name'],
                                    email: data['email'],
                                    image: data['image_url'],
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MessageScreen(
                                            name: data['name'],
                                            image: data['image_url'],
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
                      ),
                    ),
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
