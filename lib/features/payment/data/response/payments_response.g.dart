// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentsResponse _$PaymentsResponseFromJson(Map<String, dynamic> json) =>
    PaymentsResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PaymentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..message = json['message'] as String?;

Map<String, dynamic> _$PaymentsResponseToJson(PaymentsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
