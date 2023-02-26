import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class XSpacer extends StatelessWidget {
  const XSpacer({this.value, super.key});

  final double? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (value ?? 8.0).w,
    );
  }
}
