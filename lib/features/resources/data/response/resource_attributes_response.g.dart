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
      priceByHour: json['price_by_hour'] as int?,
      priceByDay: json['price_by_day'] as int?,
      priceByWeek: json['price_by_weak'] as int?,
      priceByMonth: json['price_by_month'] as int?,
      description: json['description'] as String?,
    )..message = json['message'] as String?;

Map<String, dynamic> _$ResourceAttributesResponseToJson(
        ResourceAttributesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'name': instance.name,
      'number_seats': instance.numberSeats,
      'thumbnail_image': instance.thumbnailImage,
      'price_by_hour': instance.priceByHour,
      'price_by_day': instance.priceByDay,
      'price_by_weak': instance.priceByWeek,
      'price_by_month': instance.priceByMonth,
      'description': instance.description,
    };
