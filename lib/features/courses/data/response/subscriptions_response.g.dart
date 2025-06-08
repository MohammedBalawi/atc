// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionsResponse _$SubscriptionsResponseFromJson(
        Map<String, dynamic> json) =>
    SubscriptionsResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SubscriptionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..message = json['message'] as String?;

Map<String, dynamic> _$SubscriptionsResponseToJson(
        SubscriptionsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
