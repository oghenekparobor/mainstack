import 'package:flutter/material.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/config/route/route.dart';
import 'package:mainstack/core/util/toast.dart';
import 'package:mainstack/core/widgets/button/outline_button.dart';
import 'package:mainstack/core/widgets/textfield/textfield.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add_sub_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add_template.dart';
import 'package:mainstack/modules/editor/presentation/widgets/image/add_header.dart';
import 'package:mainstack/modules/editor/presentation/widgets/image/select_layout.dart';
import 'package:mainstack/modules/editor/presentation/widgets/image/upload.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/spacer/yspacer.dart';

class AddImageElement extends StatelessWidget {
  const AddImageElement({
    super.key,
    this.id,
  });

  final String? id;

  @override
  Widget build(BuildContext context) {
    return AddTemplate(
      label: 'Add Image',
      child: Consumer<ElementNotifer>(
        builder: (_, value, __) => ReorderableListView(
          children: [
            const SelectImageLayout(key: ValueKey('select_image_layout')),
            const AddImageHeader(key: ValueKey('add_image_header')),
            for (var i in value.images)
              SubMovableElementTemplate(
                key: ValueKey('add_image_tile_1_${i.id}'),
                label: 'Image',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    UploadTile(id: i.id, file: i.image),
                    const YSpacer(value: 20),
                    MyTextField(
                      defaultValue: i.caption,
                      title: 'Caption (optional)',
                      focusNode: FocusNode(),
                      onChanged: (p0) => es.updateImage('caption', p0, i.id),
                    ),
                    const YSpacer(value: 20),
                    MyTextField(
                      defaultValue: i.alt,
                      title: 'Alt text (optional)',
                      focusNode: FocusNode(),
                      onChanged: (p0) => es.updateImage('alt', p0, i.id),
                    ),
                    const YSpacer(value: 20),
                    MyTextField(
                      defaultValue: i.link,
                      title: 'Link (optional)',
                      focusNode: FocusNode(),
                      onChanged: (p0) => es.updateImage('link', p0, i.id),
                    ),
                    const YSpacer(value: 20),
                  ],
                ),
                onDelete: () => es.removeImageField(i.id),
              ),
            MyOutlineButton(
              key: const ValueKey('add_more_image'),
              label: 'Add Image',
              icon: const Icon(Icons.add, size: 18),
              onTap: () => es.addImage(),
            ),
          ],
          onReorder: (oldIndex, newIndex) => es.rearrangeImages(
            oldIndex: oldIndex,
            newIndex: newIndex,
            lenthOfWidgets: es.images.length,
            top: 2,
            bottom: 1,
          ),
        ),
      ),
      onTap: () => save(),
    );
  }

  save() {
    if (es.validateImage()) {
      es.addImageToElements(id);

      nav.popUntil(ModalRoute.withName(Routes.editor));

      MyToast().show('Element added successfully', error: false);
    }
  }
}
