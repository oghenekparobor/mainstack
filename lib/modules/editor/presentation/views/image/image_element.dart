import 'package:flutter/material.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/modules/editor/presentation/views/image/preview_image_element_carousel.dart';
import 'package:mainstack/modules/editor/presentation/views/image/preview_image_element_grid.dart';
import 'package:mainstack/modules/editor/presentation/views/image/preview_image_element_single.dart';
import 'package:mainstack/modules/editor/presentation/widgets/element_template.dart';

class ImageElement extends StatelessWidget {
  const ImageElement({super.key});

  @override
  Widget build(BuildContext context) {
    return ElementTemplate(
      label: 'Image',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Title',
            style: theme.textTheme.displayMedium,
          ),
          Text(
            'Description',
            style: theme.textTheme.bodyLarge,
          ),
          const YSpacer(value: 20),
          const PreviewImageSingle(),
        ],
      ),
    );
  }
}
