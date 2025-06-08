// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceDetailsResponse _$ResourceDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    ResourceDetailsResponse(
      data: json['data'] == null
          ? null
          : ResourceDetailsDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )..message = json['message'] as String?;

Map<String, dynamic> _$ResourceDetailsResponseToJson(
        ResourceDetailsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
