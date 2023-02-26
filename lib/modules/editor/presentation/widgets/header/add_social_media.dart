import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/util/dialog.dart';
import 'package:mainstack/core/widgets/button/outline_button.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/core/widgets/textfield/textfield.dart';
import 'package:mainstack/modules/editor/presentation/views/header/add_link.dart';

class AddSocialMedia extends StatelessWidget {
  const AddSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
       
        for (var i = 0; i < 3; i++)
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                width: .5.w,
                color: Colors.grey.shade300,
              ),
            ),
            margin: EdgeInsets.only(bottom: 15.h),
            child: ExpansionTile(
              tilePadding: EdgeInsets.zero,
              leading: const Icon(Icons.drag_indicator),
              childrenPadding: EdgeInsets.symmetric(vertical: 10.h),
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Twitter',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.delete_outline),
                  ),
                ],
              ),
              children: [
                const YSpacer(value: 20),
               
              ],
            ),
          ),
        const YSpacer(),
        MyOutlineButton(
          label: 'Add links',
          icon: const Icon(Icons.add, size: 18),
          onTap: () {
            MyDialog().showDialog(const AddLinks());
          },
        ),
        const YSpacer(value: 20),
      ],
    );
  }
}
