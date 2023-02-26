import 'package:flutter/material.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/modules/editor/presentation/widgets/image/image_tile.dart';

class PreviewImageGrid extends StatelessWidget {
  const PreviewImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (var i = 0; i < 3; i++) ImageTile(width: size.width * .36),
      ],
    );
  }
}
