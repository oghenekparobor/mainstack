import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';

class PreviewVideoElement extends StatelessWidget {
  const PreviewVideoElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Header',
          style: theme.textTheme.displayMedium,
        ),
        const YSpacer(value: 50),
        FancyShimmerImage(
          boxDecoration: BoxDecoration(
            color: Colors.red.shade300,
            borderRadius: BorderRadius.circular(10.r),
          ),
          boxFit: BoxFit.cover,
          width: double.infinity,
          height: 200.h,
          imageUrl:
              'https://upload.wikimedia.org/wikipedia/commons/4/42/YouTube_icon_%282013-2017%29.png',
        ),
      ],
    );
  }
}
