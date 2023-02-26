import 'package:flutter/material.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/button/filled_button.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/core/widgets/textfield/textfield.dart';
import 'package:mainstack/modules/editor/presentation/widgets/header/add_applicable_title.dart';
import 'package:mainstack/modules/editor/presentation/widgets/header/add_social_media.dart';
import 'package:mainstack/modules/editor/presentation/widgets/header/upload_image.dart';

class EditHeader extends StatefulWidget {
  const EditHeader({super.key});

  @override
  State<EditHeader> createState() => _EditHeaderState();
}

class _EditHeaderState extends State<EditHeader> {
  late FocusNode dispNameNode;
  late FocusNode bioNode;
  late FocusNode appTitleNode;

  @override
  void initState() {
    dispNameNode = FocusNode();
    bioNode = FocusNode();
    appTitleNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    dispNameNode.dispose();
    bioNode.dispose();
    appTitleNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                'Editor header',
                style: theme.textTheme.displayLarge,
              ),
              const Spacer(),
              IconButton(
                onPressed: () => nav.pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const YSpacer(),
          Expanded(
            child: ReorderableListView(
              onReorder: (oldIndex, newIndex) {},
              children: [
                const UploadImage(key: ValueKey('upload_image')),
                const YSpacer(value: 30, key: ValueKey('spacer_30')),
                MyTextField(
                  key: const ValueKey('display_name'),
                  title: 'Display name',
                  focusNode: dispNameNode,
                ),
                const YSpacer(
                  value: 20,
                  key: ValueKey('spacer_20_1'),
                ),
                MyTextField(
                  key: const ValueKey('bio'),
                  title: 'Bio',
                  maxline: 6,
                  maxlength: 500,
                  focusNode: bioNode,
                ),
                const YSpacer(
                  value: 20,
                  key: ValueKey('spacer_20_2'),
                ),
                AddApplicableTitle(
                  key: const ValueKey('add_applicable_title'),
                  focusNode: appTitleNode,
                ),
                const YSpacer(
                  value: 20,
                  key: ValueKey('spacer_20_3'),
                ),
                const AddSocialMedia(
                  key: ValueKey('social_media'),
                ),
              ],
            ),
          ),
          const YSpacer(value: 20),
          MyFilledButton(
            label: 'Save',
            fontSize: 16,
            onTap: () {
              nav.pop();
            },
          ),
        ],
      ),
    );
  }
}
