import 'package:equatable/equatable.dart';
import 'package:mainstack/modules/editor/data/model/image/image.dart';

class ImageElementEntity extends Equatable {
  const ImageElementEntity({
    required this.desc,
    required this.hasHeader,
    required this.id,
    required this.images,
    required this.layout,
    required this.title,
  });

  final String id;
  final String layout;
  final bool hasHeader;
  final String title;
  final String desc;
  final List<ImageModel> images;

  @override
  List<Object?> get props => [
        id,
        layout,
        hasHeader,
        title,
        desc,
        images,
      ];
}
