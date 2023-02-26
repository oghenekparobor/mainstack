import 'package:flutter/material.dart';
import 'package:mainstack/modules/editor/data/model/link/link_element.dart';
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
