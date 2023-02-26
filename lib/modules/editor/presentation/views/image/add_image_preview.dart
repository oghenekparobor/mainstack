import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/button/outline_button.dart';
import 'package:mainstack/core/widgets/textfield/textfield.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add_sub_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add_template.dart';
import 'package:mainstack/modules/editor/presentation/widgets/image/add_header.dart';
import 'package:mainstack/modules/editor/presentation/widgets/image/select_layout.dart';

import '../../../../../core/widgets/spacer/yspacer.dart';

class AddImageElement extends StatelessWidget {
  const AddImageElement({super.key});

  @override
  Widget build(BuildContext context) {
    return AddTemplate(
      label: 'Add Image',
      child: ReorderableListView(
        children: [
          const SelectImageLayout(key: ValueKey('select_image_layout')),
          const AddImageHeader(key: ValueKey('add_image_header')),
          SubMovableElementTemplate(
            key: const ValueKey('add_image_tile_1'),
            label: 'Image',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  child: Container(
                    width: double.infinity,
                    height: 200.h,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(242, 242, 247, 1),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            right: 4.w,
                            bottom: 4.h,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.primaryColor,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Icon(Icons.image, size: 13.sp),
                        ),
                        const YSpacer(),
                        Text(
                          'Upload your Image',
                          style: theme.textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Minimum width 480px, 16:9 recommeded\n(Image should not exceed 5MB)',
                          style: theme.textTheme.titleSmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const YSpacer(value: 20),
                MyTextField(
                  title: 'Caption (optional)',
                  focusNode: FocusNode(),
                ),
                const YSpacer(value: 20),
                MyTextField(
                  title: 'Alt text (optional)',
                  focusNode: FocusNode(),
                ),
                const YSpacer(value: 20),
                MyTextField(
                  title: 'Link (optional)',
                  focusNode: FocusNode(),
                ),
                const YSpacer(value: 20),
              ],
            ),
          ),
          MyOutlineButton(
            key: const ValueKey('add_more_image'),
            label: 'Add Image',
            icon: const Icon(Icons.add, size: 18),
            onTap: () {},
          ),
        ],
        onReorder: (oldIndex, newIndex) {},
      ),
    );
  }
}
