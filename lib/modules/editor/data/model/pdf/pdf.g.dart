// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PdfModel _$PdfModelFromJson(Map<String, dynamic> json) => PdfModel(
      file: json['file'] as String,
      id: json['id'] as String,
      position: json['position'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$PdfModelToJson(PdfModel instance) => <String, dynamic>{
      'id': instance.id,
      'position': instance.position,
      'title': instance.title,
      'file': instance.file,
    };
