import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/modules/editor/data/model/header/social-media/social_media.dart';

class HeaderSocialLink extends StatelessWidget {
  const HeaderSocialLink({
    super.key,
    required this.smm,
  });

  final SocialMediaModel smm;

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
      child: FancyShimmerImage(
        imageUrl: smm.icon,
        width: 24.w,
        height: 24.h,
      ),
    );
  }
}
