import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/core/widgets/textfield/textfield.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';
import 'package:provider/provider.dart';

class AddVideoHeader extends StatefulWidget {
  const AddVideoHeader({super.key});

  @override
  State<AddVideoHeader> createState() => _AddVideoHeaderState();
}

class _AddVideoHeaderState extends State<AddVideoHeader> {
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
              title: Text('Header', style: theme.textTheme.bodyMedium),
              trailing: CupertinoSwitch(
                value: value.videoHasHeader,
                activeColor: theme.primaryColor,
                onChanged: (_) {
                  setState(() {
                    value.videoHasHeader = !value.videoHasHeader;
                  });
                },
              ),
            ),
            Visibility(
              visible: value.videoHasHeader,
              child: const YSpacer(value: 20),
            ),
            Visibility(
              visible: value.videoHasHeader,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                ),
                child: MyTextField(
                  title: 'Title',
                  labelSize: 14,
                  focusNode: FocusNode(),
                  onChanged: (p0) => value.videoHeader = p0,
                  defaultValue: value.videoHeader,
                ),
              ),
            ),
            Visibility(
              visible: value.videoHasHeader,
              child: const YSpacer(value: 20),
            ),
          ],
        ),
      ),
    );
  }
}
