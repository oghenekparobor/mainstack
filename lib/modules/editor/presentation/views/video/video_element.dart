import 'package:flutter/material.dart';
import 'package:mainstack/modules/editor/data/model/video/video_element.dart';
import 'package:mainstack/modules/editor/presentation/views/video/preview_video_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/element_template.dart';

class VideoElement extends StatelessWidget {
  const VideoElement({
    super.key,
    required this.vem,
  });

  final VideoElementModel vem;

  @override
  Widget build(BuildContext context) {
    return ElementTemplate(
      label: 'Video',
      child: PreviewVideoElement(vem: vem),
    );
  }
}
