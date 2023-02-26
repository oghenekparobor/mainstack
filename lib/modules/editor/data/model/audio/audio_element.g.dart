// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioElementModel _$AudioElementModelFromJson(Map<String, dynamic> json) =>
    AudioElementModel(
      audios: (json['audios'] as List<dynamic>)
          .map((e) => AudioModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasHeader: json['hasHeader'] as bool,
      id: json['id'] as String,
      position: json['position'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$AudioElementModelToJson(AudioElementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'position': instance.position,
      'hasHeader': instance.hasHeader,
      'title': instance.title,
      'audios': instance.audios,
    };
