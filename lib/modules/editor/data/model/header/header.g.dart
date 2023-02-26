// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeaderModel _$HeaderModelFromJson(Map<String, dynamic> json) => HeaderModel(
      applicableTitle: json['applicableTitle'] as String,
      bannerImage: json['bannerImage'] as String?,
      bio: json['bio'] as String,
      displayName: json['displayName'] as String,
      displayPicture: json['displayPicture'] as String,
      id: json['id'] as String,
      socialMedia: (json['socialMedia'] as List<dynamic>)
          .map((e) => SocialMediaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HeaderModelToJson(HeaderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bannerImage': instance.bannerImage,
      'displayPicture': instance.displayPicture,
      'displayName': instance.displayName,
      'bio': instance.bio,
      'applicableTitle': instance.applicableTitle,
      'socialMedia': instance.socialMedia,
    };
