import 'package:json_annotation/json_annotation.dart';
import 'package:mainstack/modules/editor/domain/entities/image/image.dart';

part 'image.g.dart';

@JsonSerializable()
class ImageModel extends ImageEntity {
  const ImageModel({
    required super.alt,
    required super.caption,
    required super.id,
    required super.image,
    required super.link,
    required super.position,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
