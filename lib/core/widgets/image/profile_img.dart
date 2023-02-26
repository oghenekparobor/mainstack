import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/header_service.dart';
import 'package:provider/provider.dart';

class MyProfileImage extends StatelessWidget {
  const MyProfileImage({
    super.key,
    this.radius,
  });

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Consumer<HeaderNotifer>(
      builder: (_, value, __) => CircleAvatar(
        maxRadius: (radius ?? 30).r,
        backgroundImage: NetworkImage(
          value.header?.displayPicture ??
              'https://lh3.googleusercontent.com/a/AGNmyxbu9wU6LZlWmMOkKR5KiH9oN35OydQQaR0g47epIQ=s96-c',
        ),
      ),
    );
  }
}
