// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_subscription_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseSubscriptionResponse _$CourseSubscriptionResponseFromJson(
        Map<String, dynamic> json) =>
    CourseSubscriptionResponse(
      status: json['status'] as bool?,
    )..message = json['message'] as String?;

Map<String, dynamic> _$CourseSubscriptionResponseToJson(
        CourseSubscriptionResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
