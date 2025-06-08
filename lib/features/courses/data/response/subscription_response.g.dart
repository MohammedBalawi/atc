// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionResponse _$SubscriptionResponseFromJson(
        Map<String, dynamic> json) =>
    SubscriptionResponse(
      subscriptionAttributesResponse: json['attributes'] == null
          ? null
          : SubscriptionAttributesResponse.fromJson(
              json['attributes'] as Map<String, dynamic>),
      id: json['id'] as int?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$SubscriptionResponseToJson(
        SubscriptionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'attributes': instance.subscriptionAttributesResponse,
    };
