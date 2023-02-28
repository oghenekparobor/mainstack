import 'package:flutter/material.dart';
import 'package:mainstack/core/util/dialog.dart';
import 'package:mainstack/modules/editor/data/model/text/text_element.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';
import 'package:mainstack/modules/editor/presentation/views/text/add_text_element.dart';
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
      delete: () => es.removeElement(tem.id),
      edit: () {
        es.editText(tem.text);
        MyDialog().showDialog(AddTextElement(id: tem.id));
      },
      duplicate: () => es.duplicateText(tem.text),
    );
  }
}
