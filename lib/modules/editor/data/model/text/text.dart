import 'package:json_annotation/json_annotation.dart';
import 'package:mainstack/core/util/element.dart';
import 'package:mainstack/modules/editor/domain/entities/text/text.dart';

part 'text.g.dart';

@JsonSerializable()
class TextModel extends TextEntity {
  const TextModel({
    required super.body,
    required super.header,
    required super.id,
  });

  factory TextModel.fromJson(Map<String, dynamic> json) =>
      _$TextModelFromJson(json);

  Map<String, dynamic> toJson() => _$TextModelToJson(this);
}
