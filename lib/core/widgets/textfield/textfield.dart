import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.title,
    this.textInputType = TextInputType.text,
    this.maxline,
    this.maxlength,
    required this.focusNode,
    this.labelSize,
    this.prefix,
    this.radius,
    this.controller,
    this.onChanged,
    this.defaultValue,
  });

  final String title;
  final TextInputType textInputType;
  final int? maxline;
  final int? maxlength;
  final FocusNode focusNode;
  final Widget? prefix;
  final int? labelSize;
  final double? radius;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? defaultValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: theme.textTheme.titleSmall!.copyWith(
            fontSize: (labelSize ?? 10).sp,
          ),
        ),
        const YSpacer(),
        TextField(
          controller: defaultValue == null
              ? controller
              : TextEditingController(text: defaultValue),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular((radius ?? 10).r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            filled: true,
            fillColor: focusNode.hasFocus ? Colors.white : null,
            prefixIcon: prefix,
          ),
          onChanged: onChanged,
          maxLines: maxline,
          maxLength: maxlength,
        ),
      ],
    );
  }
}
