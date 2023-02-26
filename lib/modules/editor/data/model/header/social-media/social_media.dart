import 'package:json_annotation/json_annotation.dart';
import 'package:mainstack/modules/editor/domain/entities/header/social_mdeia.dart';

part 'social_media.g.dart';

@JsonSerializable()
class SocialMediaModel extends SocialMediaEntity {
  const SocialMediaModel({
    required super.id,
    required super.icon,
    required super.link,
  });

  factory SocialMediaModel.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaModelFromJson(json);

  Map<String, dynamic> toJson() => _$SocialMediaModelToJson(this);
}
