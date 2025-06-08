// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_description_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDescriptionResponse _$CourseDescriptionResponseFromJson(
        Map<String, dynamic> json) =>
    CourseDescriptionResponse(
      id: json['course_id'] as int?,
      userRate: (json['user_rate'] as num?)?.toDouble(),
      isRated: json['isRated'] as bool?,
      courseDescriptionAttributesResponse: json['attributes'] == null
          ? null
          : CourseDescriptionAttributesResponse.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseDescriptionResponseToJson(
        CourseDescriptionResponse instance) =>
    <String, dynamic>{
      'course_id': instance.id,
      'isRated': instance.isRated,
      'user_rate': instance.userRate,
      'attributes': instance.courseDescriptionAttributesResponse,
    };
