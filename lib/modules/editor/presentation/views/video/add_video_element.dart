import 'package:flutter/material.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/button/outline_button.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/core/widgets/textfield/textfield.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add_sub_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add_template.dart';
import 'package:mainstack/modules/editor/presentation/widgets/video/add_header.dart';
import 'package:mainstack/modules/editor/presentation/widgets/video/select_platform.dart';

class AddVideoElement extends StatelessWidget {
  const AddVideoElement({super.key});

  @override
  Widget build(BuildContext context) {
    return AddTemplate(
      label: 'Add Video',
      child: ReorderableListView(
        children: [
          const SelectvideoPlatform(key: ValueKey('select_video_platform')),
          const AddVideoHeader(key: ValueKey('add_video_header')),
          SubMovableElementTemplate(
            key: const ValueKey('video_1'),
            label: 'Video',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyTextField(
                  title: 'Link',
                  labelSize: 14,
                  focusNode: FocusNode(),
                ),
                const YSpacer(),
                Text(
                  'Paste your youtube link here.',
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
          ),
          MyOutlineButton(
            key: const ValueKey('add_more_video'),
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
