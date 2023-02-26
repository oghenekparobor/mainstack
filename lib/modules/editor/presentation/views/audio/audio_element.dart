import 'package:flutter/material.dart';
import 'package:mainstack/modules/editor/presentation/views/audio/preview_audio_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/element_template.dart';

class AudioElement extends StatelessWidget {
  const AudioElement({super.key});

  @override
  Widget build(BuildContext context) {
    return const ElementTemplate(
      label: 'Audio',
      child: PreviewAudioElement(),
    );
  }
}
