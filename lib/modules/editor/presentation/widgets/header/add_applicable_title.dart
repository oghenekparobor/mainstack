import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/header_service.dart';
import 'package:provider/provider.dart';

class AddApplicableTitle extends StatefulWidget {
  const AddApplicableTitle({
    super.key,
    required this.focusNode,
  });

  final FocusNode focusNode;

  @override
  State<AddApplicableTitle> createState() => _AddApplicableTitleState();
}

class _AddApplicableTitleState extends State<AddApplicableTitle> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

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
        Consumer<HeaderNotifer>(
          builder: (_, value, __) => TextField(
            focusNode: widget.focusNode,
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              filled: true,
              fillColor: widget.focusNode.hasFocus ? Colors.white : null,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              prefixIcon: (value.header == null ||
                      value.header!.applicableTitle.isEmpty)
                  ? null
                  : Wrap(
                      children: [
                        for (var i = 0;
                            i < (value.header?.applicableTitle ?? []).length;
                            i++)
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.w,
                            ),
                            child: Chip(
                              backgroundColor: Colors.grey.shade300,
                              elevation: 0,
                              label: Text(
                                value.header?.applicableTitle[i],
                                style: theme.textTheme.titleSmall!.copyWith(
                                  fontSize: 8.sp,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              deleteIcon: const Icon(
                                Icons.close,
                                size: 18,
                              ),
                              onDeleted: () => hn.removeAppTitle(i),
                            ),
                          ),
                      ],
                    ),
            ),
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                hn.addAppTitle(value.trim());
                controller.clear();

                widget.focusNode.nextFocus();
              } else {
                FocusScope.of(context).unfocus();
              }
            },
          ),
        ),
      ],
    );
  }
}
