import 'package:json_annotation/json_annotation.dart';
import 'package:mainstack/core/util/element.dart';
import 'package:mainstack/modules/editor/data/model/image/image.dart';
import 'package:mainstack/modules/editor/domain/entities/image/image_element.dart';

part 'image_element.g.dart';

@JsonSerializable()
class ImageElementModel extends ImageElementEntity  {
  const ImageElementModel({
    required super.desc,
    required super.hasHeader,
    required super.id,
    required super.images,
    required super.layout,
    required super.title,
  });

  factory ImageElementModel.fromJson(Map<String, dynamic> json) =>
      _$ImageElementModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageElementModelToJson(this);
}
