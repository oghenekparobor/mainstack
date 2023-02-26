import 'package:flutter/material.dart';
import 'package:mainstack/modules/editor/presentation/views/video/preview_video_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/element_template.dart';

class VideoElement extends StatelessWidget {
  const VideoElement({super.key});

  @override
  Widget build(BuildContext context) {
    return const ElementTemplate(
      label: 'Video',
      child: PreviewVideoElement(),
    );
  }
}
