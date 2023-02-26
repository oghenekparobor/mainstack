import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';

class AddApplicableTitle extends StatelessWidget {
  const AddApplicableTitle({
    super.key,
    required this.focusNode,
  });

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Applicable Titles',
          style: theme.textTheme.titleSmall,
        ),
        const YSpacer(),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            filled: true,
            fillColor: focusNode.hasFocus ? Colors.white : null,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            prefixIcon: Wrap(
              children: [
                for (var i = 0; i < 2; i++)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                    ),
                    child: Chip(
                      backgroundColor: Colors.grey.shade300,
                      elevation: 0,
                      label: Text(
                        'Lorem ipsum',
                        style: theme.textTheme.titleSmall!
                            .copyWith(fontSize: 8.sp),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      deleteIcon: const Icon(
                        Icons.close,
                        size: 18,
                      ),
                      onDeleted: () {},
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
