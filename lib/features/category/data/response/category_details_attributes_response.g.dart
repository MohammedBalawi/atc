// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_details_attributes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDetailsAttributesResponse _$CategoryDetailsAttributesResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryDetailsAttributesResponse(
      name: json['name'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
      banner: json['banner'] as String?,
      resources: (json['resource'] as List<dynamic>?)
          ?.map((e) => CategoryDetailsResourceResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryDetailsAttributesResponseToJson(
        CategoryDetailsAttributesResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'icon': instance.icon,
      'banner': instance.banner,
      'resource': instance.resources,
    };
