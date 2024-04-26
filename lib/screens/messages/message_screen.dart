import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/cubit/message_cubit.dart';
import 'package:homework/data/models/message_model.dart';
import 'package:homework/screens/messages/widgets/pop_menu_button.dart';
import 'package:homework/utils/app_colors.dart';

import '../../data/models/contact_models.dart';
import '../../utils/size_utils.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key, required this.contactModel});

  final ContactModel contactModel;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<MessageModel> messages = context
        .watch<MessageCubit>()
        .sortMessage(contactId: widget.contactModel.contactId);

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
          "${widget.contactModel.contactName} ${widget.contactModel.contactLasName}",
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
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                MessageModel messageModel = messages[index];
                if (messageModel.contactId != 111) {
                  return Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        padding: const EdgeInsets.all(20),
                        width: width - 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: const Color(0xFFD84D4D),
                        ),
                        child: Text(
                          messageModel.messageText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      DeleteButton(
                        onTabDelete: () {
                          context
                              .read<MessageCubit>()
                              .removeMessages(messageModel: messageModel);
                          Navigator.pop(context);
                        },
                        onTabCopy: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                }
                return Row(
                  children: [
                    DeleteButton(
                      onTabDelete: () {
                        context
                            .read<MessageCubit>()
                            .removeMessages(messageModel: messageModel);
                        Navigator.pop(context);
                      },
                      onTabCopy: () {
                        Navigator.pop(context);
                      },
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      padding: const EdgeInsets.all(20),
                      width: width - 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                      child: Text(
                        messageModel.messageText,
                        style: TextStyle(
                          color: const Color(0xFF595F69),
                          fontSize: 16.sp,
                        ),
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
                  onPressed: () {
                    MessageModel messageModel = MessageModel(
                      createdTime: DateTime.now().toString(),
                      messageText: controller.text,
                      messageId: widget.contactModel.contactId,
                      isFile: false,
                      contactId: 111,
                      status: true,
                    );
                    context
                        .read<MessageCubit>()
                        .insertMessages(messageModel: messageModel);
                    controller.clear();
                    setState(() {});
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
