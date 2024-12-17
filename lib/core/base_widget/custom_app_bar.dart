import '../theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBack;
  const CustomAppBar({super.key, required this.title, this.isBack = false});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.brown,
      centerTitle: true,
      leading: isBack
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ))
          : const SizedBox(),
      title: Text(title, style: TextStyles.font16WhiteSemiBold),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40.h);
}
