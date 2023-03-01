import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/assets/files.dart';
import 'package:mainstack/core/widgets/spacer/xspacer.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';
import 'package:mainstack/modules/editor/presentation/views/header/header_preview.dart';
import 'package:provider/provider.dart';

class MyPreview extends StatelessWidget {
  const MyPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ElementNotifer>(
        builder: (context, value, child) => ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            const HeaderPreview(key: ValueKey('editor_header')),
            for (var i = 0; i < value.elements.length; i++)
              Padding(
                padding: EdgeInsets.only(bottom: 50.h, right: 16.w, left: 16.w),
                child: value.showPreview(value.elements[i]),
              ),
            const YSpacer(value: 50, key: ValueKey('bottom_spacer1')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Built with',
                  style: theme.textTheme.displayMedium,
                ),
                const XSpacer(),
                SvgPicture.asset(
                  kLogo,
                  width: 24.w,
                  height: 24.h,
                ),
                const XSpacer(),
                Text(
                  'Mainstack',
                  style: theme.textTheme.displayMedium,
                ),
              ],
            ),
            const YSpacer(value: 150, key: ValueKey('bottom_spacer')),
          ],
        ),
      ),
    );
  }
}
