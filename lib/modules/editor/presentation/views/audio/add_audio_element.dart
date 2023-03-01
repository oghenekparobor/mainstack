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
import 'package:mainstack/modules/editor/presentation/widgets/audio/add_header.dart';
import 'package:mainstack/modules/editor/presentation/widgets/audio/select_platform.dart';
import 'package:mainstack/modules/editor/presentation/widgets/not_draggable.dart';
import 'package:provider/provider.dart';

class AddAudioElement extends StatelessWidget {
  const AddAudioElement({
    super.key,
    this.id,
  });

  final String? id;

  @override
  Widget build(BuildContext context) {
    return AddTemplate(
      label: 'Add Audio',
      child: Consumer<ElementNotifer>(
        builder: (_, value, __) => ReorderableListView(
          onReorder: (oldIndex, newIndex) => value.rearrangeAudios(
            oldIndex: oldIndex,
            newIndex: newIndex,
            lenthOfWidgets: value.audios.length,
            top: 2,
            bottom: 1,
          ),
          children: [
            const NotDraggable(
              key: ValueKey('select_audio_platform'),
              child: SelectAudioPlatform(),
            ),
            const NotDraggable(
              key: ValueKey('add_audio_header'),
              child: AddAudioHeader(),
            ),
            for (var i in value.audios)
              SubMovableElementTemplate(
                key: ValueKey('sub_audio menu_${i.id}'),
                label: 'Audio',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyTextField(
                      defaultValue: i.link,
                      title: 'Link',
                      labelSize: 14,
                      focusNode: FocusNode(),
                      onChanged: (p0) => value.updateAudio('link', p0, i.id),
                    ),
                    const YSpacer(),
                    Text(
                      'Paste playlist url from either Spotify, Soundcloud, Apple music and YouTube Music.',
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
                onDelete: () => value.removeAudioField(i.id),
              ),
            NotDraggable(
              key: const ValueKey('add_more_audio'),
              child: MyOutlineButton(
                label: 'Add More',
                icon: const Icon(Icons.add, size: 18),
                onTap: () => es.addAudio(),
              ),
            ),
          ],
        ),
      ),
      onTap: () => save(),
    );
  }

  save() {
    if (es.validateAudio()) {
      es.addAudioToElements(id);

      nav.popUntil(ModalRoute.withName(Routes.editor));

      MyToast().show('Element added successfully', error: false);
    }
  }
}
