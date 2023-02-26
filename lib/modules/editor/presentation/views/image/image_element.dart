import 'package:flutter/material.dart';
import 'package:mainstack/modules/editor/data/model/image/image_element.dart';
import 'package:mainstack/modules/editor/presentation/views/image/preview_image_element_carousel.dart';
import 'package:mainstack/modules/editor/presentation/views/image/preview_image_element_grid.dart';
import 'package:mainstack/modules/editor/presentation/views/image/preview_image_element_single.dart';
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
      child: layout(iem),
    );
  }

  Widget layout(ImageElementModel iem) {
    switch (iem.layout.toLowerCase()) {
      case 'single':
        return PreviewImageSingle(iem: iem);
      case 'grid':
        return PreviewImageGrid(iem: iem);
      case 'carousel':
        return PreviewImageCarousel(iem: iem);
      default:
        return const SizedBox();
    }
  }
}
