// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_details_resource_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDetailsResourceResponse _$CategoryDetailsResourceResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryDetailsResourceResponse(
      id: json['id'] as int?,
      attributes: json['attributes'] == null
          ? null
          : ResourceAttributesResponse.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryDetailsResourceResponseToJson(
        CategoryDetailsResourceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };
