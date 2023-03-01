import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/core/widgets/textfield/textfield.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';
import 'package:provider/provider.dart';

class AddAudioHeader extends StatefulWidget {
  const AddAudioHeader({super.key});

  @override
  State<AddAudioHeader> createState() => _AddAudioHeaderState();
}

class _AddAudioHeaderState extends State<AddAudioHeader> {
  bool showHeader = false;

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
                value: value.audioHasHeader,
                activeColor: theme.primaryColor,
                onChanged: (_) {
                  setState(() {
                    value.audioHasHeader = !value.audioHasHeader;
                  });
                },
              ),
            ),
            Visibility(
              visible: value.audioHasHeader,
              child: const YSpacer(value: 20),
            ),
            Visibility(
              visible: value.audioHasHeader,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                ),
                child: MyTextField(
                  defaultValue: value.audioHeader,
                  title: 'Title',
                  labelSize: 14,
                  focusNode: FocusNode(),
                  onChanged: (p0) => value.audioHeader = p0,
                ),
              ),
            ),
            Visibility(
              visible: value.audioHasHeader,
              child: const YSpacer(value: 20),
            ),
          ],
        ),
      ),
    );
  }
}
