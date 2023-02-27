import 'dart:io';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/image/profile_img.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/header_service.dart';
import 'package:mainstack/modules/editor/presentation/widgets/header/applicable_title.dart';
import 'package:mainstack/modules/editor/presentation/widgets/header/social_link.dart';
import 'package:provider/provider.dart';

class HeaderPreview extends StatelessWidget {
  const HeaderPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HeaderNotifer>(
      builder: (_, value, __) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: double.infinity,
            height: 200.h,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: (value.header == null ||
                          value.header!.bannerImage == null)
                      ? FancyShimmerImage(
                          imageUrl:
                              'https://www.flyingmammut.com/wp-content/uploads/2016/12/Urgup-Balloons-02.jpg',
                          height: 150.h,
                          width: double.infinity,
                          boxFit: BoxFit.cover,
                          errorWidget: Container(
                            height: 150.h,
                            width: double.infinity,
                            color: Colors.grey,
                          ),
                        )
                      : Image.file(
                          File(value.header!.bannerImage ?? ''),
                          height: 150.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const MyProfileImage(radius: 40),
                  ),
                )
              ],
            ),
          ),
          const YSpacer(value: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  value.header?.displayName ?? '',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.displayMedium,
                ),
                if (value.header != null && value.header!.bio.isNotEmpty)
                  const YSpacer(value: 10),
                if (value.header != null && value.header!.bio.isNotEmpty)
                  Text(
                    value.header?.bio ?? '',
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
          const YSpacer(value: 10),
          Wrap(
            alignment: WrapAlignment.center,
            // crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              for (var sm in (value.header?.socialMedia ?? []))
                if (sm.link.isNotEmpty) HeaderSocialLink(smm: sm),
            ],
          ),
          const YSpacer(value: 10),
          Wrap(
            // crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              for (var at in (value.header?.applicableTitle ?? []))
                ApplicableTitle(label: at)
            ],
          ),
          const YSpacer(value: 50),
        ],
      ),
    );
  }
}
