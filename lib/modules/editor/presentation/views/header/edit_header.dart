import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/util/dialog.dart';
import 'package:mainstack/core/util/toast.dart';
import 'package:mainstack/core/widgets/button/filled_button.dart';
import 'package:mainstack/core/widgets/button/outline_button.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/core/widgets/textfield/textfield.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/header_service.dart';
import 'package:mainstack/modules/editor/presentation/views/header/add_link.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add_sub_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/header/add_applicable_title.dart';
import 'package:mainstack/modules/editor/presentation/widgets/header/add_social_media.dart';
import 'package:mainstack/modules/editor/presentation/widgets/header/upload_image.dart';
import 'package:provider/provider.dart';

class EditHeader extends StatefulWidget {
  const EditHeader({super.key});

  @override
  State<EditHeader> createState() => _EditHeaderState();
}

class _EditHeaderState extends State<EditHeader> {
  late FocusNode dispNameNode;
  late FocusNode bioNode;
  late FocusNode appTitleNode;

  late TextEditingController dispName;
  late TextEditingController bio;

  @override
  void initState() {
    dispNameNode = FocusNode();
    bioNode = FocusNode();
    appTitleNode = FocusNode();

    dispName = TextEditingController();
    bio = TextEditingController();

    Future.delayed(Duration.zero, _init);

    super.initState();
  }

  @override
  void dispose() {
    dispNameNode.dispose();
    bioNode.dispose();
    appTitleNode.dispose();

    dispName.dispose();
    bio.dispose();

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
            child: Consumer<HeaderNotifer>(
              builder: (_, value, __) => ReorderableListView(
                onReorder: (oldIndex, newIndex) => value.rearrangeSocialMedia(
                  oldIndex,
                  newIndex,
                ),
                children: [
                  const UploadImage(key: ValueKey('upload_image')),
                  const YSpacer(
                    key: ValueKey('spacer_30'),
                    value: 30,
                  ),
                  MyTextField(
                    key: const ValueKey('display_name'),
                    title: 'Display name',
                    focusNode: dispNameNode,
                    controller: dispName,
                  ),
                  const YSpacer(
                    key: ValueKey('spacer_20_1'),
                    value: 20,
                  ),
                  MyTextField(
                    key: const ValueKey('bio'),
                    title: 'Bio',
                    maxline: 6,
                    maxlength: 500,
                    focusNode: bioNode,
                    controller: bio,
                  ),
                  const YSpacer(
                    key: ValueKey('spacer_20_2'),
                    value: 20,
                  ),
                  AddApplicableTitle(
                    key: const ValueKey('add_applicable_title'),
                    focusNode: appTitleNode,
                  ),
                  const YSpacer(
                    key: ValueKey('spacer_20_3'),
                    value: 20,
                  ),
                  Text(
                    key: const ValueKey('social_media_header'),
                    'Social Media',
                    style: theme.textTheme.titleSmall,
                  ),
                  const YSpacer(key: ValueKey('spacer_3')),
                  for (var sm in (hn.header?.socialMedia ?? []))
                    SubMovableElementTemplate(
                      key: ValueKey('header_social_media_${sm.id}'),
                      label: sm.name,
                      onDelete: () => hn.removeSocialMedia(sm.id),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyTextField(
                            defaultValue: sm.link,
                            title: 'Username',
                            focusNode: FocusNode(),
                            labelSize: 15,
                            prefix: const Icon(
                              Icons.tag,
                              color: Colors.grey,
                            ),
                            onChanged: (p0) => hn.updateSocialMediaLink(
                              sm.id,
                              p0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  MyOutlineButton(
                    key: const ValueKey('add_header_social_links'),
                    label: 'Add links',
                    icon: const Icon(Icons.add, size: 18),
                    onTap: () {
                      MyDialog().showDialog(const AddLinks());
                    },
                  ),
                  const YSpacer(
                    value: 100,
                    key: ValueKey('spacer_100_3'),
                  ),
                ],
              ),
            ),
          ),
          const YSpacer(value: 20),
          MyFilledButton(
            label: 'Save',
            fontSize: 16,
            onTap: () => save(),
          ),
        ],
      ),
    );
  }

  FutureOr _init() {
    dispName.text = hn.header?.displayName ?? '';
    bio.text = hn.header?.bio ?? '';
  }

  save() {
    if (hn.validateSocialMedia()) {
      hn.updateHeader('displayName', dispName.text);
      hn.updateHeader('bio', bio.text);
      hn.updateHeader('bannerImage', hn.banner);

      nav.pop();

      MyToast().show('Updated successfully', error: false);
    }
  }
}
