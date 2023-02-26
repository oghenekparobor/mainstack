import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class ImageEntity extends Equatable {
  const ImageEntity({
    required this.alt,
    required this.caption,
    required this.id,
    required this.image,
    required this.link,
    required this.position,
  });

  final String id;
  final int position;
  final String image;
  @JsonKey(required: false)
  final String? caption;
  @JsonKey(required: false)
  final String? alt;
  @JsonKey(required: false)
  final String? link;

  @override
  List<Object?> get props => [
        id,
        position,
        image,
        caption,
        alt,
        link,
        image,
      ];
}
