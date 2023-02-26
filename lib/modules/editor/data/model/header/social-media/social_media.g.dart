// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialMediaModel _$SocialMediaModelFromJson(Map<String, dynamic> json) =>
    SocialMediaModel(
      id: json['id'] as String,
      icon: json['icon'] as String,
      link: json['link'] as String,
      name: json['name'] as String,
      position: json['position'] as int,
    );

Map<String, dynamic> _$SocialMediaModelToJson(SocialMediaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'icon': instance.icon,
      'name': instance.name,
      'position': instance.position,
    };
