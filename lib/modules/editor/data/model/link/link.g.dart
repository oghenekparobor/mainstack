// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkModel _$LinkModelFromJson(Map<String, dynamic> json) => LinkModel(
      id: json['id'] as String,
      link: json['link'] as String,
      position: json['position'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$LinkModelToJson(LinkModel instance) => <String, dynamic>{
      'id': instance.id,
      'position': instance.position,
      'title': instance.title,
      'link': instance.link,
    };
