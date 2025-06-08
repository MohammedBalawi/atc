// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservations_user_attributes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationsUserAttributesResponse _$ReservationsUserAttributesResponseFromJson(
        Map<String, dynamic> json) =>
    ReservationsUserAttributesResponse(
      resourceName: json['resource_name'] as String?,
      resourceImage: json['resource_image'] as String?,
      categoryName: json['category_name'] as String?,
      userName: json['user_name'] as String?,
      description: json['description'] as String?,
      resourceId: json['resource_id'] as int?,
      paymentMethod: json['payment_method'] as String?,
      price: (json['cost'] as num?)?.toDouble(),
      rate: (json['rate'] as num?)?.toDouble(),
      avatar: json['avatar'] as String?,
      start_date: json['start_date'] as String?,
      end_date: json['end_date'] as String?,
      isVerifiedPayment: json['is_verified_payment'] as bool?,
    );

Map<String, dynamic> _$ReservationsUserAttributesResponseToJson(
        ReservationsUserAttributesResponse instance) =>
    <String, dynamic>{
      'resource_name': instance.resourceName,
      'resource_image': instance.resourceImage,
      'category_name': instance.categoryName,
      'user_name': instance.userName,
      'description': instance.description,
      'resource_id': instance.resourceId,
      'payment_method': instance.paymentMethod,
      'cost': instance.price,
      'rate': instance.rate,
      'avatar': instance.avatar,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'is_verified_payment': instance.isVerifiedPayment,
    };
