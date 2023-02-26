import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YSpacer extends StatelessWidget {
  const YSpacer({this.value, super.key});

  final double? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (value ?? 8.0).h,
    );
  }
}
