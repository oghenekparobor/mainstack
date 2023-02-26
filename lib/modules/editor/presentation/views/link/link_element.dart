import 'package:flutter/material.dart';
import 'package:mainstack/modules/editor/presentation/views/link/preview_link_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/element_template.dart';

class LinkElement extends StatelessWidget {
  const LinkElement({super.key});

  @override
  Widget build(BuildContext context) {
    return ElementTemplate(
      label: 'Link',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < 2; i++) const PreviewLinkElement(),
        ],
      ),
    );
  }
}
