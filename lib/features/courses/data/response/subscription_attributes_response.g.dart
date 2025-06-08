// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_attributes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionAttributesResponse _$SubscriptionAttributesResponseFromJson(
        Map<String, dynamic> json) =>
    SubscriptionAttributesResponse(
      course_id: json['course_id'] as int?,
      courseImage: json['course_image'] as String?,
      courseName: json['course_name'] as String?,
      courseDescription: json['course_description'] as String?,
      courseDays: json['course_days'] as String?,
      reservationStartDate: json['start_date'] as String?,
      reservationPrice: (json['price'] as num?)?.toDouble(),
      paymentMethod: json['payment_method'] as String?,
      reservationHours: (json['hours'] as num?)?.toDouble(),
      reservationLectureHours: (json['lecture_hours'] as num?)?.toDouble(),
      reservationIsVerifiedPayment: json['is_verified_payment'] as bool?,
    )..reservationEndDate = json['end_date'] as String?;

Map<String, dynamic> _$SubscriptionAttributesResponseToJson(
        SubscriptionAttributesResponse instance) =>
    <String, dynamic>{
      'course_id': instance.course_id,
      'course_image': instance.courseImage,
      'course_name': instance.courseName,
      'course_description': instance.courseDescription,
      'course_days': instance.courseDays,
      'start_date': instance.reservationStartDate,
      'end_date': instance.reservationEndDate,
      'price': instance.reservationPrice,
      'payment_method': instance.paymentMethod,
      'hours': instance.reservationHours,
      'lecture_hours': instance.reservationLectureHours,
      'is_verified_payment': instance.reservationIsVerifiedPayment,
    };
