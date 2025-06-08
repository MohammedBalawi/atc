// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_attributes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryAttributeResponse _$CategoryAttributeResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryAttributeResponse(
      name: json['name'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
      banner: json['banner'] as String?,
    );

Map<String, dynamic> _$CategoryAttributeResponseToJson(
        CategoryAttributeResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'icon': instance.icon,
      'banner': instance.banner,
    };
