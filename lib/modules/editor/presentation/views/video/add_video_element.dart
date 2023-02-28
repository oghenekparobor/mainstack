import 'package:flutter/material.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/config/route/route.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/util/toast.dart';
import 'package:mainstack/core/widgets/button/outline_button.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/core/widgets/textfield/textfield.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add_sub_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add_template.dart';
import 'package:mainstack/modules/editor/presentation/widgets/not_draggable.dart';
import 'package:mainstack/modules/editor/presentation/widgets/video/add_header.dart';
import 'package:mainstack/modules/editor/presentation/widgets/video/select_platform.dart';
import 'package:provider/provider.dart';

class AddVideoElement extends StatelessWidget {
  const AddVideoElement({
    super.key,
    this.id,
  });

  final String? id;

  @override
  Widget build(BuildContext context) {
    return AddTemplate(
      label: 'Add Video',
      child: Consumer<ElementNotifer>(
        builder: (_, value, __) => ReorderableListView(
          children: [
            const NotDraggable(
              key: ValueKey('select_video_platform'),
              child: SelectvideoPlatform(),
            ),
            const NotDraggable(
              key: ValueKey('add_video_header'),
              child: AddVideoHeader(),
            ),
            for (var i in value.videos)
              SubMovableElementTemplate(
                key: ValueKey('video_1_${i.id}'),
                label: 'Video',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyTextField(
                      defaultValue: i.link,
                      title: 'Link',
                      labelSize: 14,
                      focusNode: FocusNode(),
                      onChanged: (p0) => value.updateVideo('link', p0, i.id),
                    ),
                    const YSpacer(),
                    Text(
                      'Paste your ${value.vplatform[value.videoPlatformSelected]['label']} link here.',
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
                onDelete: () => value.removeVideoField(i.id),
              ),
            NotDraggable(
              key: const ValueKey('add_more_video'),
              child: MyOutlineButton(
                key: const ValueKey('add_more_video'),
                label: 'Add More',
                icon: const Icon(Icons.add, size: 18),
                onTap: () => value.addVideo(),
              ),
            ),
            const YSpacer(key: ValueKey('bottom_spacer'), value: 50),
          ],
          onReorder: (oldIndex, newIndex) => es.rearrangeVideo(
            bottom: 1,
            lenthOfWidgets: es.videos.length,
            newIndex: newIndex,
            oldIndex: oldIndex,
            top: 2,
          ),
        ),
      ),
      onTap: () => save(),
    );
  }

  save() {
    if (es.validateVideo()) {
      es.addVideoToElements(id);

      nav.popUntil(ModalRoute.withName(Routes.editor));

      MyToast().show('Element added successfully', error: false);
    }
  }
}
