import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/services/chat_services.dart';
import '../../utils/size_utils.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen(
      {super.key,
      required this.name,
      required this.receiverUserId,
      required this.image});

  final String name;
  final String image;
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
      backgroundColor: const Color(0xFF1B202D),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF1B202D),
        leading: Row(
          children: [
            10.getW(),
            ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Image.network(
                widget.image,
                width: 40.w,
                height: 40.h,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        title: Text(
          widget.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 28.sp,
              color: Colors.white,
            ),
            splashRadius: 20.r,
          ),
          26.getW(),
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
                          return InkWell(
                            onLongPress: () async {
                              await chatServices.deleteMessage(
                                data[index].id,
                                firebaseAuth.currentUser!.uid,
                                widget.receiverUserId,
                              );
                            },
                            child: Align(
                              alignment: json['sender_id'] ==
                                      firebaseAuth.currentUser!.uid
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                    vertical: 10.h,
                                  ),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: json['sender_id'] ==
                                            firebaseAuth.currentUser!.uid
                                        ? const Color(0xFF7A8194)
                                        : const Color(0xFF373E4E),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Text(
                                    json['message'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
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
            margin: EdgeInsets.only(
              left: 26.w,
              right: 26.w,
              bottom: 37.h,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: const Color(0xFF3D4354),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 1.h),
            child: Row(
              children: [
                Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      size: 25.sp,
                      color: const Color(0xFF9398A7),
                    ),
                    splashRadius: 20.r,
                  ),
                ),
                Expanded(
                  child: TextField(
                    maxLines: null,
                    maxLength: null,
                    controller: controller,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 13.h,
                      ),
                      hintText: "Message",
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(.45),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () async {
                      await sendMessage();
                    },
                    icon: Icon(
                      Icons.send,
                      size: 25.sp,
                      color: const Color(0xFF9398A7),
                    ),
                    splashRadius: 20.r,
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
