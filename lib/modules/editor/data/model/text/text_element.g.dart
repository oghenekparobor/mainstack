// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextElementModel _$TextElementModelFromJson(Map<String, dynamic> json) =>
    TextElementModel(
      id: json['id'] as String,
      text: TextModel.fromJson(json['text'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TextElementModelToJson(TextElementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
    };
