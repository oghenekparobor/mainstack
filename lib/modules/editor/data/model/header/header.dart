import 'package:json_annotation/json_annotation.dart';
import 'package:mainstack/modules/editor/data/model/social-media/social_media.dart';
import 'package:mainstack/modules/editor/domain/entities/header.dart';

part 'header.g.dart';

@JsonSerializable()
class HeaderModel extends HeaderEntity {
  const HeaderModel({
    required super.applicableTitle,
    required super.bannerImage,
    required super.bio,
    required super.displayName,
    required super.displayPicture,
    required super.id,
    required super.socialMedia,
  });

  factory HeaderModel.fromJson(Map<String, dynamic> json) =>
      _$HeaderModelFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderModelToJson(this);
}
