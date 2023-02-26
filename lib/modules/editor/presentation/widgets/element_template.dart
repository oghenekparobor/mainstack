import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/modules/editor/presentation/widgets/element_menu_buttons.dart';

class ElementTemplate extends StatelessWidget {
  const ElementTemplate({
    super.key,
    required this.child,
    required this.label,
    this.delete,
    this.duplicate,
    this.edit,
  });

  final Widget child;
  final String label;
  final VoidCallback? edit;
  final VoidCallback? duplicate;
  final VoidCallback? delete;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(Icons.drag_indicator),
        ),
        childrenPadding: EdgeInsets.symmetric(vertical: 10.h),
        title: Text(label, style: theme.textTheme.bodyMedium),
        children: [
          const YSpacer(value: 20),
          child,
          const YSpacer(value: 20),
          ElementMenuButtons(
            delete: delete,
            edit: edit,
            duplicate: duplicate,
          ),
          const YSpacer(value: 20),
        ],
      ),
    );
  }
}
