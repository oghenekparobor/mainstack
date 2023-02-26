import 'package:flutter/material.dart';
import 'package:mainstack/core/widgets/button/outline_button.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add_sub_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add_template.dart';
import 'package:mainstack/modules/editor/presentation/widgets/audio/add_header.dart';
import 'package:mainstack/modules/editor/presentation/widgets/audio/select_platform.dart';

class AddAudioElement extends StatelessWidget {
  const AddAudioElement({super.key});

  @override
  Widget build(BuildContext context) {
    return AddTemplate(
      label: 'Add Audio',
      child: ReorderableListView(
        onReorder: (oldIndex, newIndex) {},
        children: [
          const SelectAudioPlatform(key: ValueKey('select_audio_platform')),
          const AddAudioHeader(key: ValueKey('add_audio_header')),
          SubMovableElementTemplate(
            key: const ValueKey('sub_audio menu'),
            label: 'Audio',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [],
            ),
          ),
          MyOutlineButton(
            key: const ValueKey('add_more_audio'),
            label: 'Add More',
            icon: const Icon(Icons.add, size: 18),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
