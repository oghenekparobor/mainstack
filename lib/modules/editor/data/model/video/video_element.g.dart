// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoElementModel _$VideoElementModelFromJson(Map<String, dynamic> json) =>
    VideoElementModel(
      hasHeader: json['hasHeader'] as bool,
      id: json['id'] as String,
      platform: json['platform'] as String,
      title: json['title'] as String,
      videos: (json['videos'] as List<dynamic>)
          .map((e) => VideoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoElementModelToJson(VideoElementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'platform': instance.platform,
      'hasHeader': instance.hasHeader,
      'title': instance.title,
      'videos': instance.videos,
    };
