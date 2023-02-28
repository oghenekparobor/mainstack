import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/core/widgets/textfield/textfield.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';
import 'package:provider/provider.dart';

class AddImageHeader extends StatefulWidget {
  const AddImageHeader({super.key});

  @override
  State<AddImageHeader> createState() => _AddImageHeaderState();
}

class _AddImageHeaderState extends State<AddImageHeader> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ElementNotifer>(
      builder: (_, value, __) => AnimatedContainer(
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
                value: value.imageHasHeader,
                activeColor: theme.primaryColor,
                onChanged: (_) {
                  setState(() {
                    value.imageHasHeader = !value.imageHasHeader;
                  });
                },
              ),
            ),
            Visibility(
              visible: value.imageHasHeader,
              child: const YSpacer(value: 20),
            ),
            Visibility(
              visible: value.imageHasHeader,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                ),
                child: MyTextField(
                  defaultValue: value.imageHeader,
                  title: 'Title',
                  labelSize: 14,
                  focusNode: FocusNode(),
                  onChanged: (p0) => value.imageHeader = p0,
                ),
              ),
            ),
            Visibility(
              visible: value.imageHasHeader,
              child: const YSpacer(value: 20),
            ),
            Visibility(
              visible: value.imageHasHeader,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                ),
                child: MyTextField(
                  defaultValue: value.imageDesc,
                  title: 'Description (optional)',
                  labelSize: 14,
                  focusNode: FocusNode(),
                  maxline: 6,
                  onChanged: (p0) => value.imageDesc = p0,
                ),
              ),
            ),
            Visibility(
              visible: value.imageHasHeader,
              child: const YSpacer(value: 20),
            ),
          ],
        ),
      ),
    );
  }
}
