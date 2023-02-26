import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
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
      actions: const [
        MyFilledButton(label: 'Preview'),
        XSpacer(),
      ],
    ).asGlass();
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
