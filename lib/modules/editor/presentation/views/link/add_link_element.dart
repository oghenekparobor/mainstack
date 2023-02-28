import 'package:flutter/material.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/config/route/route.dart';
import 'package:mainstack/core/util/toast.dart';
import 'package:mainstack/core/widgets/button/outline_button.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add_template.dart';
import 'package:mainstack/modules/editor/presentation/widgets/link/add_link_tile.dart';
import 'package:mainstack/modules/editor/presentation/widgets/not_draggable.dart';
import 'package:provider/provider.dart';

class AddLinkElement extends StatelessWidget {
  const AddLinkElement({
    super.key,
    this.edit,
  });

  final String? edit;

  @override
  Widget build(BuildContext context) {
    return AddTemplate(
      label: 'Add link',
      onTap: () {
        if (es.validateLink()) {
          es.addLinkToElements(edit);
          nav.popUntil(ModalRoute.withName(Routes.editor));

          MyToast().show('Element added successfully', error: false);
        }
      },
      child: Consumer<ElementNotifer>(
        builder: (context, value, child) => ReorderableListView(
          onReorder: (oldIndex, newIndex) =>
              es.reorderLinks(oldIndex, newIndex),
          children: [
            for (var i in value.links)
              AddLinkTile(
                key: ValueKey('link_${i.id}'),
                lm: i,
              ),
            child!,
          ],
        ),
        child: NotDraggable(
          key: const ValueKey('add_link'),
          child: MyOutlineButton(
            label: 'Add links',
            icon: const Icon(Icons.add, size: 18),
            onTap: () => es.addLink(),
          ),
        ),
      ),
    );
  }
}
