import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/button/outline_button.dart';
import 'package:mainstack/core/widgets/spacer/xspacer.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/core/widgets/textfield/textfield.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add_sub_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add_template.dart';
import 'package:mainstack/modules/editor/presentation/widgets/pdf/add_header.dart';

class AddPdfElement extends StatelessWidget {
  const AddPdfElement({super.key});

  @override
  Widget build(BuildContext context) {
    return AddTemplate(
      label: 'Add Pdf',
      child: ReorderableListView(
        children: [
          const AddPdfHeader(key: ValueKey('add_pdf_header')),
          SubMovableElementTemplate(
            key: const ValueKey('add_pdf_tile_1'),
            label: 'Pdf',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyTextField(
                  title: 'Title',
                  labelSize: 14,
                  focusNode: FocusNode(),
                ),
                const YSpacer(value: 20),
                Container(
                  width: double.infinity,
                  height: 200.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      width: .5.w,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.picture_as_pdf_outlined),
                      const YSpacer(),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Drop your files here, ',
                              style: theme.textTheme.titleSmall,
                            ),
                            TextSpan(
                              text: 'or click to browse',
                              style: theme.textTheme.titleSmall!.copyWith(
                                color: Colors.deepOrange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // if file has been uploaded state
                SizedBox(
                  height: 70.h,
                  child: Row(
                    children: [
                      Container(
                        width: 85.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: const Icon(Icons.picture_as_pdf_outlined),
                      ),
                      const XSpacer(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const YSpacer(value: 3),
                            Text(
                              '121121213113342432423424.pdf',
                              style: theme.textTheme.bodyMedium,
                            ),
                            const YSpacer(value: 3),
                            Text(
                              '50KB',
                              style: theme.textTheme.bodyMedium!
                                  .copyWith(color: Colors.grey.shade500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          MyOutlineButton(
            key: const ValueKey('add_more_pdf'),
            label: 'Add More',
            icon: const Icon(Icons.add, size: 18),
            onTap: () {},
          ),
        ],
        onReorder: (oldIndex, newIndex) {},
      ),
    );
  }
}
