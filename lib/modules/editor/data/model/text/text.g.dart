// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextModel _$TextModelFromJson(Map<String, dynamic> json) => TextModel(
      body: json['body'] as String,
      header: json['header'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$TextModelToJson(TextModel instance) => <String, dynamic>{
      'id': instance.id,
      'header': instance.header,
      'body': instance.body,
    };
