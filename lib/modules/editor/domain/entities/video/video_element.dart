import 'package:equatable/equatable.dart';
import 'package:mainstack/core/util/element.dart';
import 'package:mainstack/modules/editor/data/model/video/video.dart';

class VideoElementEntity extends Equatable with EditorElements {
  const VideoElementEntity({
    required this.hasHeader,
    required this.id,
    required this.platform,
    required this.title,
    required this.videos,
  });

  final String id;
  final String platform;
  final bool hasHeader;
  final String title;
  final List<VideoModel> videos;

  @override
  List<Object?> get props => [
        hasHeader,
        id,
        platform,
        title,
        videos,
      ];
}
