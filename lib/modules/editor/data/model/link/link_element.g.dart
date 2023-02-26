// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkElementModel _$LinkElementModelFromJson(Map<String, dynamic> json) =>
    LinkElementModel(
      id: json['id'] as String,
      links: (json['links'] as List<dynamic>)
          .map((e) => LinkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LinkElementModelToJson(LinkElementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'links': instance.links,
    };
