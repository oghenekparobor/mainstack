import 'package:json_annotation/json_annotation.dart';
import 'package:mainstack/modules/editor/domain/entities/link/link.dart';

part 'link.g.dart';

@JsonSerializable()
class LinkModel extends LinkEntity {
  const LinkModel({
    required super.id,
    required super.link,
    required super.position,
    required super.title,
  });

  factory LinkModel.fromJson(Map<String, dynamic> json) =>
      _$LinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$LinkModelToJson(this);
}
