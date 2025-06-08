// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceDataResponse _$ResourceDataResponseFromJson(
        Map<String, dynamic> json) =>
    ResourceDataResponse(
      id: json['id'] as int?,
      attributes: json['attributes'] == null
          ? null
          : ResourceAttributesResponse.fromJson(
              json['attributes'] as Map<String, dynamic>),
      reservations: (json['reservations'] as List<dynamic>?)
          ?.map((e) =>
              ResourceReservationsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..message = json['message'] as String?;

Map<String, dynamic> _$ResourceDataResponseToJson(
        ResourceDataResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'id': instance.id,
      'attributes': instance.attributes,
      'reservations': instance.reservations,
    };
