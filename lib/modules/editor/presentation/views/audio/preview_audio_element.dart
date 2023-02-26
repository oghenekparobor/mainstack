import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';

class PreviewAudioElement extends StatelessWidget {
  const PreviewAudioElement({super.key});

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
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: FancyShimmerImage(
            boxDecoration: BoxDecoration(
              color: Colors.red.shade300,
              borderRadius: BorderRadius.circular(10.r),
            ),
            boxFit: BoxFit.cover,
            width: double.infinity,
            height: 200.h,
            imageUrl:
                'https://lh3.googleusercontent.com/sx-pdsK_mPwCo4YZ1FMKs1RcgwunSIfbMy801gxx1PZjQdnzld2CbrzOHxaXAOu72D2ibB9F_VrKo0fZxw=w544-h544-l90-rj',
          ),
        ),
      ],
    );
  }
}
