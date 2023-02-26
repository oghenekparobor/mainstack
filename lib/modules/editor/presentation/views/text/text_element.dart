import 'package:flutter/material.dart';
import 'package:mainstack/modules/editor/data/model/text/text_element.dart';
import 'package:mainstack/modules/editor/presentation/views/text/preview_text_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/element_template.dart';

class TextElement extends StatelessWidget {
  const TextElement({
    super.key,
    required this.tem,
  });

  final TextElementModel tem;

  @override
  Widget build(BuildContext context) {
    return ElementTemplate(
      label: 'Text',
      child: PreviewTextLink(tm: tem.text),
    );
  }
}
