import 'package:flutter/material.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/core/widgets/textfield/textfield.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add_sub_element.dart';

class AddLinkTile extends StatelessWidget {
  const AddLinkTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SubMovableElementTemplate(
      label: 'Link',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyTextField(
            title: 'Title',
            focusNode: FocusNode(),
            labelSize: 15,
          ),
          const YSpacer(),
          MyTextField(
            title: 'Link',
            focusNode: FocusNode(),
            labelSize: 15,
          ),
        ],
      ),
    );
  }
}
