import 'package:equatable/equatable.dart';
import 'package:mainstack/core/util/element.dart';
import 'package:mainstack/modules/editor/data/model/audio/audio.dart';

class AudioElementEntity extends Equatable with EditorElements {
  const AudioElementEntity({
    required this.audios,
    required this.hasHeader,
    required this.id,
    required this.position,
    required this.title,
  });

  final String id;
  final int position;
  final bool hasHeader;
  final String title;
  final List<AudioModel> audios;

  @override
  List<Object?> get props => [id, position, hasHeader, title, audios];
}
