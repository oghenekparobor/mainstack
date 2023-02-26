// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageElementModel _$ImageElementModelFromJson(Map<String, dynamic> json) =>
    ImageElementModel(
      desc: json['desc'] as String,
      hasHeader: json['hasHeader'] as bool,
      id: json['id'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      layout: json['layout'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$ImageElementModelToJson(ImageElementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'layout': instance.layout,
      'hasHeader': instance.hasHeader,
      'title': instance.title,
      'desc': instance.desc,
      'images': instance.images,
    };
