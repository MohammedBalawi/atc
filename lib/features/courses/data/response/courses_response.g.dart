// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoursesResponse _$CoursesResponseFromJson(Map<String, dynamic> json) =>
    CoursesResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CourseResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..message = json['message'] as String?;

Map<String, dynamic> _$CoursesResponseToJson(CoursesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
