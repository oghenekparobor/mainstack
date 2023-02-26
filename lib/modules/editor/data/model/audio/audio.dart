import 'package:json_annotation/json_annotation.dart';
import 'package:mainstack/core/util/element.dart';
import 'package:mainstack/modules/editor/domain/entities/audio/audio.dart';

part 'audio.g.dart';

@JsonSerializable()
class AudioModel extends AudioEntity  {
  const AudioModel({
    required super.id,
    required super.link,
    required super.position,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) =>
      _$AudioModelFromJson(json);

  Map<String, dynamic> toJson() => _$AudioModelToJson(this);
}
