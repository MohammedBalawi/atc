// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDetailsResponse _$CategoryDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryDetailsResponse(
      data: json['data'] == null
          ? null
          : CategoryDetailsDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )..message = json['message'] as String?;

Map<String, dynamic> _$CategoryDetailsResponseToJson(
        CategoryDetailsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
