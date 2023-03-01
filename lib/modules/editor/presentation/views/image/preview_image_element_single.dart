import 'package:flutter/material.dart';
import 'package:mainstack/modules/editor/data/model/image/image_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/image/image_tile.dart';

class PreviewImageSingle extends StatelessWidget {
  const PreviewImageSingle({
    super.key,
    required this.iem,
  });

  final ImageElementModel iem;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: ValueKey('image_element_${iem.id}'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i in iem.images) ImageTile(width: double.infinity, im: i),
      ],
    );
  }
}
