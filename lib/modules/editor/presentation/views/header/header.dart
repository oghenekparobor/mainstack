import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/util/dialog.dart';
import 'package:mainstack/core/widgets/button/outline_button.dart';
import 'package:mainstack/core/widgets/image/profile_img.dart';
import 'package:mainstack/core/widgets/spacer/xspacer.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/modules/editor/presentation/views/header/edit_header.dart';
import 'package:mainstack/modules/editor/presentation/widgets/header/applicable_title.dart';
import 'package:mainstack/modules/editor/presentation/widgets/header/social_link.dart';

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
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
              child: FancyShimmerImage(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Oghenekparobor Eminokanju',
                              style: theme.textTheme.displayMedium,
                            ),
                            const YSpacer(value: 10),
                            Text(
                              "Your bio goes here 🎉 Click the 'Edit Profile' above to tell your audience about yourself and your incredible works. You can also add social media icons for yourself or business as well. ❤️️️",
                              style: theme.textTheme.bodySmall,
                            ),
                            const YSpacer(value: 10),
                            Wrap(
                              children: [
                                for (var i = 0; i < 6; i++)
                                  const HeaderSocialLink(),
                              ],
                            ),
                            const YSpacer(value: 10),
                            Wrap(
                              children: [
                                for (var i = 0; i < 6; i++)
                                  const ApplicableTitle(label: 'label')
                              ],
                            )
                          ],
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
