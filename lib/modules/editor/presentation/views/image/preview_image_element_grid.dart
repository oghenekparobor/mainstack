import 'package:flutter/material.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/modules/editor/data/model/image/image_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/image/image_tile.dart';

class PreviewImageGrid extends StatelessWidget {
  const PreviewImageGrid({
    super.key,
    required this.iem,
  });

  final ImageElementModel iem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Wrap(
        alignment: WrapAlignment.center,
        key: ValueKey('image_element_${iem.id}'),
        children: [
          for (var i in iem.images) ImageTile(width: size.width * .36, im: i),
        ],
      ),
    );
  }
}
