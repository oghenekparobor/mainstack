// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioModel _$AudioModelFromJson(Map<String, dynamic> json) => AudioModel(
      id: json['id'] as String,
      link: json['link'] as String,
      position: json['position'] as int,
    );

Map<String, dynamic> _$AudioModelToJson(AudioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'position': instance.position,
      'link': instance.link,
    };
