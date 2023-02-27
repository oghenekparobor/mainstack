import 'package:flutter/material.dart';
import 'package:mainstack/core/util/dialog.dart';
import 'package:mainstack/modules/editor/data/model/link/link_element.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';
import 'package:mainstack/modules/editor/presentation/views/link/add_link_element.dart';
import 'package:mainstack/modules/editor/presentation/views/link/preview_link_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/element_template.dart';

class LinkElement extends StatelessWidget {
  const LinkElement({
    super.key,
    required this.lem,
  });

  final LinkElementModel lem;

  @override
  Widget build(BuildContext context) {
    return ElementTemplate(
      label: 'Link',
      delete: () => es.removeElement(lem.id),
      edit: () {
        es.editLink(lem.links);
        MyDialog().showDialog(AddLinkElement(edit: lem.id));
      },
      duplicate: () => es.duplicateLinks(lem.links),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < lem.links.length; i++)
            PreviewLinkElement(lm: lem.links[i]),
        ],
      ),
    );
  }
}
