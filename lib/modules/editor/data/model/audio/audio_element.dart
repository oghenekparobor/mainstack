import 'package:json_annotation/json_annotation.dart';
import 'package:mainstack/modules/editor/data/model/audio/audio.dart';
import 'package:mainstack/modules/editor/domain/entities/audio/audio_element.dart';

part 'audio_element.g.dart';

@JsonSerializable()
class AudioElementModel extends AudioElementEntity {
  const AudioElementModel({
    required super.audios,
    required super.hasHeader,
    required super.id,
    required super.position,
    required super.title,
  });

  factory AudioElementModel.fromJson(Map<String, dynamic> json) =>
      _$AudioElementModelFromJson(json);

  Map<String, dynamic> toJson() => _$AudioElementModelToJson(this);
}
