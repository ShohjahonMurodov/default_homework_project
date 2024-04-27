import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/services/chat_services.dart';
import 'package:homework/utils/app_colors.dart';
import '../../utils/size_utils.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen(
      {super.key, required this.name, required this.receiverUserId});

  final String name;
  final String receiverUserId;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController controller = TextEditingController();
  final ChatServices chatServices = ChatServices();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final ScrollController scrollController = ScrollController();

  Future<void> sendMessage() async {
    if (controller.text.isNotEmpty) {
      await chatServices.sentMessage(
        recieverId: widget.receiverUserId,
        message: controller.text,
      );
      controller.clear();
      scrollController.position.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 150),
          curve: Curves.linear);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FC),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 25.sp,
          ),
        ),
        title: Text(
          widget.name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 25.sp,
              color: AppColors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              size: 25.sp,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: chatServices.getMessages(
                widget.receiverUserId,
                firebaseAuth.currentUser!.uid,
              ),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var data = snapshot.data!.docs;
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          Map<String, dynamic> json =
                              data[index].data() as Map<String, dynamic>;
                          return Align(
                            alignment: json['sender_id'] ==
                                    firebaseAuth.currentUser!.uid
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              padding: const EdgeInsets.all(20),
                              width: width - 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: json['sender_id'] ==
                                        firebaseAuth.currentUser!.uid
                                    ? Colors.transparent
                                    : const Color(0xFFD84D4D),
                                border: json['sender_id'] ==
                                        firebaseAuth.currentUser!.uid
                                    ? Border.all(color: Colors.grey, width: 2)
                                    : Border.all(
                                        color: const Color(0xFFD84D4D),
                                        width: 2),
                              ),
                              child: Text(
                                json['message'],
                                style: TextStyle(
                                  color: json['sender_id'] ==
                                          firebaseAuth.currentUser!.uid
                                      ? const Color(0xFF595F69)
                                      : Colors.white,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    size: 25.sp,
                    color: const Color(0xFFADB5BD),
                  ),
                ),
                Expanded(
                  child: TextField(
                    maxLines: null,
                    maxLength: null,
                    controller: controller,
                    style: TextStyle(
                      color: const Color(0xFF0F1828),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText: "Type waiting ...",
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
                IconButton(
                  onPressed: () async {
                    await sendMessage();
                  },
                  icon: Icon(
                    Icons.send,
                    size: 25.sp,
                    color: const Color(0xFFD84D4D),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
