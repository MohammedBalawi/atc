// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseResponse _$CourseResponseFromJson(Map<String, dynamic> json) =>
    CourseResponse(
      id: json['id'] as int?,
      isRated: json['isRated'] as bool?,
      userRate: (json['user_rate'] as num?)?.toDouble(),
    )..attributes = json['attributes'] == null
        ? null
        : CourseAttributesResponse.fromJson(
            json['attributes'] as Map<String, dynamic>);

Map<String, dynamic> _$CourseResponseToJson(CourseResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isRated': instance.isRated,
      'user_rate': instance.userRate,
      'attributes': instance.attributes,
    };
