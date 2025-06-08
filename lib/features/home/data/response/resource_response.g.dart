// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceResponse _$ResourceResponseFromJson(Map<String, dynamic> json) =>
    ResourceResponse(
      id: json['id'] as int?,
      resourceAttributesResponse: json['attributes'] == null
          ? null
          : ResourceAttributesResponse.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResourceResponseToJson(ResourceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.resourceAttributesResponse,
    };
