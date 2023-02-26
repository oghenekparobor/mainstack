// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PdfElementModel _$PdfElementModelFromJson(Map<String, dynamic> json) =>
    PdfElementModel(
      content: json['content'] as String,
      hasHeader: json['hasHeader'] as bool,
      id: json['id'] as String,
      pdfs: (json['pdfs'] as List<dynamic>)
          .map((e) => PdfModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PdfElementModelToJson(PdfElementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hasHeader': instance.hasHeader,
      'content': instance.content,
      'pdfs': instance.pdfs,
    };
