import 'package:flutter/material.dart';
import 'package:mainstack/modules/editor/presentation/widgets/image/image_tile.dart';

class PreviewImageSingle extends StatelessWidget {
  const PreviewImageSingle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < 3; i++) const ImageTile(width: double.infinity),
      ],
    );
  }
}
