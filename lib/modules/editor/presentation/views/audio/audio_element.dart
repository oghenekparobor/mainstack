import 'package:flutter/material.dart';
import 'package:mainstack/modules/editor/data/model/audio/audio_element.dart';
import 'package:mainstack/modules/editor/presentation/views/audio/preview_audio_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/element_template.dart';

class AudioElement extends StatelessWidget {
  const AudioElement({
    super.key,
    required this.aem,
  });

  final AudioElementModel aem;

  @override
  Widget build(BuildContext context) {
    return ElementTemplate(
      label: 'Audio',
      child: PreviewAudioElement(aem: aem),
    );
  }
}
