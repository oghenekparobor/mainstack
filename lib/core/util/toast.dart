import 'dart:async';
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/xspacer.dart';

class MyToast {
  MyToast() {
    timer = Timer(const Duration(seconds: 3), dispose);
  }

  late Timer timer;

  show(l, {bool error = true}) => toast(l, error: error);

  toast(String message, {bool error = true}) {
    showDialog(
      context: navKey.currentContext!,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SlideInRight(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                right: 16.w,
                left: 80.w,
                top: 10.h,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 15.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: const [
                  BoxShadow(color: Colors.black12),
                ],
                color: Colors.white,
                border: Border.all(),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    error ? Icons.error : Icons.done,
                    color: error ? Colors.red : Colors.green,
                  ),
                  const XSpacer(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          error ? 'Error' : 'Success',
                          style: theme.textTheme.bodyMedium,
                        ),
                        Text(
                          message,
                          style: theme.textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: dispose,
                    child: Icon(
                      Icons.close,
                      size: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void dispose() {
    nav.maybePop();

    timer.cancel();
  }
}
