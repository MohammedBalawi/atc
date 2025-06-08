// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_description_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDescriptionDataResponse _$CourseDescriptionDataResponseFromJson(
        Map<String, dynamic> json) =>
    CourseDescriptionDataResponse(
      data: json['data'] == null
          ? null
          : CourseDescriptionResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )..message = json['message'] as String?;

Map<String, dynamic> _$CourseDescriptionDataResponseToJson(
        CourseDescriptionDataResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
