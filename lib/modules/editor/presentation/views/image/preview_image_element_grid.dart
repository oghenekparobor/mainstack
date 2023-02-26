import 'package:flutter/material.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
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
    return Wrap(
      children: [
        if (iem.hasHeader)
          Text(
            iem.title,
            style: theme.textTheme.displayMedium,
          ),
        if (iem.hasHeader)
          Text(
            iem.desc,
            style: theme.textTheme.bodyLarge,
          ),
        const YSpacer(value: 20),
        for (var i in iem.images) ImageTile(width: size.width * .36, im: i),
      ],
    );
  }
}
