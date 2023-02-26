import 'dart:io';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/util/dialog.dart';
import 'package:mainstack/core/widgets/button/outline_button.dart';
import 'package:mainstack/core/widgets/image/profile_img.dart';
import 'package:mainstack/core/widgets/spacer/xspacer.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/header_service.dart';
import 'package:mainstack/modules/editor/presentation/views/header/edit_header.dart';
import 'package:mainstack/modules/editor/presentation/widgets/header/applicable_title.dart';
import 'package:mainstack/modules/editor/presentation/widgets/header/social_link.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          width: 0.5.w,
          color: Colors.grey.shade400,
        ),
      ),
      margin: EdgeInsets.only(top: 50.h, bottom: 15.h),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Consumer<HeaderNotifer>(
              builder: (_, value, __) => ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                child:
                    (value.header == null || value.header!.bannerImage == null)
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
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(
                top: 70.h,
                left: 15.w,
                right: 15.w,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 15.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MyProfileImage(),
                      const XSpacer(),
                      Expanded(
                        child: Consumer<HeaderNotifer>(
                          builder: (_, value, __) => Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                value.header?.displayName ?? '',
                                style: theme.textTheme.displayMedium,
                              ),
                              if (value.header != null &&
                                  value.header!.bio.isNotEmpty)
                                const YSpacer(value: 10),
                              if (value.header != null &&
                                  value.header!.bio.isNotEmpty)
                                Text(
                                  value.header?.bio ?? '',
                                  style: theme.textTheme.bodySmall,
                                ),
                              const YSpacer(value: 10),
                              Wrap(
                                children: [
                                  for (var sm
                                      in (value.header?.socialMedia ?? []))
                                    if (sm.link.isNotEmpty)
                                      HeaderSocialLink(smm: sm),
                                ],
                              ),
                              const YSpacer(value: 10),
                              Wrap(
                                children: [
                                  for (var at
                                      in (value.header?.applicableTitle ?? []))
                                    ApplicableTitle(label: at)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const YSpacer(value: 30),
                  MyOutlineButton(
                    label: 'Edit Header',
                    onTap: () {
                      MyDialog().showDialog(const EditHeader());
                    },
                  ),
                  const YSpacer(value: 15),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
