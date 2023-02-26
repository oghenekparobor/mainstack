// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      alt: json['alt'] as String?,
      caption: json['caption'] as String?,
      id: json['id'] as String,
      image: json['image'] as String,
      link: json['link'] as String?,
      position: json['position'] as int,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'position': instance.position,
      'image': instance.image,
      'caption': instance.caption,
      'alt': instance.alt,
      'link': instance.link,
    };
