import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/config/route/route.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/button/filled_button.dart';
import 'package:mainstack/core/widgets/image/profile_img.dart';
import 'package:mainstack/core/widgets/spacer/xspacer.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';

class EditorAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EditorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: MyProfileImage(radius: 40),
      ),
      leadingWidth: 60.w,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Editor',
            style: theme.textTheme.displayMedium,
          ),
          const YSpacer(value: 2),
          Text(
            'https://mainstack.me/oghenekparobor',
            style: theme.textTheme.titleSmall,
          ),
        ],
      ),
      actions: [
        MyFilledButton(
          label: 'Preview',
          onTap: () => preview(),
        ),
        const XSpacer(),
      ],
    ).asGlass();
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  preview() {
    Future.delayed(const Duration(milliseconds: 2500), () {
      nav.pop();
      nav.pushNamed(Routes.preview);
    });

    showDialog(
      context: navKey.currentContext!,
      builder: (_) => Center(
        child: Container(
          width: 50.w,
          height: 50.h,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
