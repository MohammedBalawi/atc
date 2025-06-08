// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_details_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceDetailsDataResponse _$ResourceDetailsDataResponseFromJson(
        Map<String, dynamic> json) =>
    ResourceDetailsDataResponse(
      id: json['id'] as int?,
      attributes: json['attributes'] == null
          ? null
          : ResourceDetailsAttributesResponse.fromJson(
              json['attributes'] as Map<String, dynamic>),
      reservations: (json['reservations'] as List<dynamic>?)
          ?.map((e) =>
              ResourceReservationsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..message = json['message'] as String?;

Map<String, dynamic> _$ResourceDetailsDataResponseToJson(
        ResourceDetailsDataResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'id': instance.id,
      'attributes': instance.attributes,
      'reservations': instance.reservations,
    };
