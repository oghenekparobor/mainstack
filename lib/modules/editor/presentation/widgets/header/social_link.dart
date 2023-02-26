import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';

class HeaderSocialLink extends StatelessWidget {
  const HeaderSocialLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 4.w,
        bottom: 4.h,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.primaryColor,
      ),
      padding: const EdgeInsets.all(8),
      child: Icon(
        Icons.face,
        color: Colors.white,
        size: 13.sp,
      ),
    );
  }
}
