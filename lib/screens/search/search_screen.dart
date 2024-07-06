import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/screens/contacts/widgets/contact_items.dart';
import 'package:homework/screens/messages/message_screen.dart';
import 'package:homework/utils/size_utils.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.contacts});

  final List contacts;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  List list = [];
  int count = 0;

  @override
  void initState() {
    list = widget.contacts;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B202D),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            70.getH(),
            TextField(
              controller: controller,
              onChanged: (value) {
                setState(() {
                  if (controller.text.isEmpty) {
                    list = widget.contacts;
                  } else {
                    list = widget.contacts.where((contact) {
                      final name = contact['name'].toLowerCase();
                      final email = contact['email'].toLowerCase();
                      final searchQuery = value.toLowerCase();
                      return name.contains(searchQuery) ||
                          email.contains(searchQuery);
                    }).toList();
                  }
                });
              },
              style: TextStyle(
                color: Colors.white.withOpacity(.58),
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.cancel,
                    size: 22.sp,
                    color: const Color(0xFF5F6A75),
                  ),
                ),
                filled: true,
                fillColor: const Color(0xFF242F3D),
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(.58),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 20.h,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide: BorderSide(
                    width: 0.w,
                    color: const Color(0xFF1B202D),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide: BorderSide(
                    width: 0.w,
                    color: const Color(0xFF1B202D),
                  ),
                ),
              ),
            ),
            30.getH(),
            ...List.generate(
              list.length,
              (index) {
                var data = list[index];
                return ContactItems(
                  name: data['name'],
                  isOnline: data['isOnline'],
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MessageScreen(
                          name: data['name'],
                          image: data['image_url'],
                          receiverUserId: data['uuid'],
                          email: data['email'],
                        ),
                      ),
                    );
                  },
                  image: data['image_url'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
