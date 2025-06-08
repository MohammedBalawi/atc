// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_rating_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseRatingResponse _$CourseRatingResponseFromJson(
        Map<String, dynamic> json) =>
    CourseRatingResponse(
      status: json['status'] as bool?,
    )..message = json['message'] as String?;

Map<String, dynamic> _$CourseRatingResponseToJson(
        CourseRatingResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
