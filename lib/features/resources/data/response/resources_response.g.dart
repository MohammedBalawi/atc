// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resources_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourcesResponse _$ResourcesResponseFromJson(Map<String, dynamic> json) =>
    ResourcesResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ResourceDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..message = json['message'] as String?;

Map<String, dynamic> _$ResourcesResponseToJson(ResourcesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
