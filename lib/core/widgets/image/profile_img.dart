import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProfileImage extends StatelessWidget {
  const MyProfileImage({
    super.key,
    this.radius,
  });

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: (radius ?? 30).r,
      backgroundImage: const NetworkImage(
        'https://lh3.googleusercontent.com/a/AGNmyxbu9wU6LZlWmMOkKR5KiH9oN35OydQQaR0g47epIQ=s96-c',
      ),
    );
  }
}
