import 'package:flutter/material.dart';
import 'package:mainstack/core/util/dialog.dart';
import 'package:mainstack/modules/editor/data/model/video/video_element.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';
import 'package:mainstack/modules/editor/presentation/views/video/add_video_element.dart';
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
      delete: () => es.removeElement(vem.id),
      duplicate: () => es.duplicatevideo(vem),
      edit: () {
        es.videoHasHeader = vem.hasHeader;
        es.videoHeader = vem.title;

        es.editVideo(vem.videos);
        MyDialog().showDialog(AddVideoElement(id: vem.id));
      },
    );
  }
}
