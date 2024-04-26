import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton(
      {super.key, required this.onTabDelete, required this.onTabCopy});

  final VoidCallback onTabDelete;
  final VoidCallback onTabCopy;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            padding: EdgeInsets.zero,
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: onTabDelete,
                child: Icon(
                  Icons.delete,
                  size: 24.sp,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          PopupMenuItem(
            padding: EdgeInsets.zero,
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: onTabCopy,
                child: Icon(
                  Icons.copy,
                  size: 24.sp,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ];
      },
    );
  }
}
