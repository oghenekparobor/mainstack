import 'package:json_annotation/json_annotation.dart';
import 'package:mainstack/modules/editor/domain/entities/video/video.dart';

part 'video.g.dart';

@JsonSerializable()
class VideoModel extends VideoEntity {
  const VideoModel({
    required super.id,
    required super.link,
    required super.position,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}
