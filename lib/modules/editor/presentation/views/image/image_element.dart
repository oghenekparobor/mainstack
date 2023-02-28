import 'package:flutter/material.dart';
import 'package:mainstack/core/util/dialog.dart';
import 'package:mainstack/modules/editor/data/model/image/image_element.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';
import 'package:mainstack/modules/editor/presentation/views/image/add_image_preview.dart';
import 'package:mainstack/modules/editor/presentation/widgets/element_template.dart';

class ImageElement extends StatelessWidget {
  const ImageElement({
    super.key,
    required this.iem,
  });

  final ImageElementModel iem;

  @override
  Widget build(BuildContext context) {
    return ElementTemplate(
      label: 'Image',
      child: es.layout(iem),
      delete: () => es.removeImageField(iem.id),
      duplicate: () => es.duplicateImage(iem),
      edit: () {
        es.imageHasHeader = iem.hasHeader;
        es.imageHeader = iem.title;
        es.imageDesc = iem.desc;
        es.selectedLayout = iem.layout.toLowerCase() == 'single'
            ? 0
            : iem.layout.toLowerCase() == 'grid'
                ? 1
                : 2;

        es.editImage(iem.images);
        MyDialog().showDialog(AddImageElement(id: iem.id));
      },
    );
  }
}
