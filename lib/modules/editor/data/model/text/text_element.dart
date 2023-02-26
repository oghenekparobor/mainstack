import 'package:json_annotation/json_annotation.dart';
import 'package:mainstack/modules/editor/data/model/text/text.dart';
import 'package:mainstack/modules/editor/domain/entities/text/text_element.dart';

part 'text_element.g.dart';

@JsonSerializable()
class TextElementModel extends TextElementEntity {
  const TextElementModel({
    required super.id,
    required super.text,
  });

  factory TextElementModel.fromJson(Map<String, dynamic> json) =>
      _$TextElementModelFromJson(json);

  Map<String, dynamic> toJson() => _$TextElementModelToJson(this);
}
