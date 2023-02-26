import 'package:json_annotation/json_annotation.dart';
import 'package:mainstack/core/util/element.dart';
import 'package:mainstack/modules/editor/data/model/video/video.dart';
import 'package:mainstack/modules/editor/domain/entities/video/video_element.dart';

part 'video_element.g.dart';

@JsonSerializable()
class VideoElementModel extends VideoElementEntity with EditorElements {
  const VideoElementModel({
    required super.hasHeader,
    required super.id,
    required super.platform,
    required super.title,
    required super.videos,
  });

  factory VideoElementModel.fromJson(Map<String, dynamic> json) =>
      _$VideoElementModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoElementModelToJson(this);
}
