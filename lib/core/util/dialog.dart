import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/app/app.dart';

class MyDialog {
  void showDialog(Widget w) {
    showGeneralDialog(
      context: navKey.currentContext!,
      barrierDismissible: false,
      barrierColor: Colors.white,
      pageBuilder: (context, animation, secondaryAnimation) => SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: w,
        ),
      ),
    );
  }
}
