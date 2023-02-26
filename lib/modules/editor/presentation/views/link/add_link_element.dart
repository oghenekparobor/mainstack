import 'package:flutter/material.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/core/widgets/button/outline_button.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add_template.dart';
import 'package:mainstack/modules/editor/presentation/widgets/link/add_link_tile.dart';

class AddLinkElement extends StatelessWidget {
  const AddLinkElement({super.key});

  @override
  Widget build(BuildContext context) {
    return AddTemplate(
      label: 'Add link',
      onTap: () => nav.pop(),
      child: ReorderableListView(
        onReorder: (oldIndex, newIndex) {},
        children: [
          const AddLinkTile(key: ValueKey('link')),
          MyOutlineButton(
            key: const ValueKey('add_link'),
            label: 'Add links',
            icon: const Icon(Icons.add, size: 18),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
