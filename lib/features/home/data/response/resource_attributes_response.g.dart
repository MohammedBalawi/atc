// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_attributes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceAttributesResponse _$ResourceAttributesResponseFromJson(
        Map<String, dynamic> json) =>
    ResourceAttributesResponse(
      name: json['name'] as String?,
      numberSeats: json['number_seats'] as int?,
      thumbnailImage: json['thumbnail_image'] as String?,
      priceByHour: (json['price_by_hour'] as num?)?.toDouble(),
      priceByDay: (json['price_by_day'] as num?)?.toDouble(),
      priceByWeak: (json['price_by_weak'] as num?)?.toDouble(),
      priceByMonth: (json['price_by_month'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ResourceAttributesResponseToJson(
        ResourceAttributesResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'number_seats': instance.numberSeats,
      'thumbnail_image': instance.thumbnailImage,
      'price_by_hour': instance.priceByHour,
      'price_by_day': instance.priceByDay,
      'price_by_weak': instance.priceByWeak,
      'price_by_month': instance.priceByMonth,
    };
