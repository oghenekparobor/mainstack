import 'package:flutter/material.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/core/widgets/textfield/textfield.dart';
import 'package:mainstack/modules/editor/data/model/link/link.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add_sub_element.dart';

class AddLinkTile extends StatelessWidget {
  const AddLinkTile({
    super.key,
    required this.lm,
  });

  final LinkModel lm;

  @override
  Widget build(BuildContext context) {
    return SubMovableElementTemplate(
      label: 'Link',
      onDelete: () => es.removeLinkField(lm.id),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyTextField(
            title: 'Title',
            focusNode: FocusNode(),
            labelSize: 15,
            defaultValue: lm.title,
            onChanged: (p0) => es.updateLink('title', p0, lm.id),
          ),
          const YSpacer(),
          MyTextField(
            title: 'Link',
            focusNode: FocusNode(),
            labelSize: 15,
            defaultValue: lm.link,
            onChanged: (p0) => es.updateLink('link', p0, lm.id),
          ),
        ],
      ),
    );
  }
}
