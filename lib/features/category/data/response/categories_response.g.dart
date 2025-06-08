// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesResponse _$CategoriesResponseFromJson(Map<String, dynamic> json) =>
    CategoriesResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..message = json['message'] as String?;

Map<String, dynamic> _$CategoriesResponseToJson(CategoriesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
