import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/core/widgets/textfield/textfield.dart';

class AddAudioHeader extends StatefulWidget {
  const AddAudioHeader({super.key});

  @override
  State<AddAudioHeader> createState() => _AddAudioHeaderState();
}

class _AddAudioHeaderState extends State<AddAudioHeader> {
  bool showHeader = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 512),
      key: const ValueKey(''),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          width: .5.w,
          color: Colors.grey.shade300,
        ),
      ),
      margin: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: Text(
              'Header',
              style: theme.textTheme.bodyMedium,
            ),
            trailing: CupertinoSwitch(
              value: showHeader,
              activeColor: theme.primaryColor,
              onChanged: (_) {
                setState(() {
                  showHeader = !showHeader;
                });
              },
            ),
          ),
          Visibility(
            visible: showHeader,
            child: const YSpacer(value: 20),
          ),
          Visibility(
            visible: showHeader,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
              ),
              child: MyTextField(
                title: 'Title',
                labelSize: 14,
                focusNode: FocusNode(),
              ),
            ),
          ),
          Visibility(
            visible: showHeader,
            child: const YSpacer(value: 20),
          ),
        ],
      ),
    );
  }
}
