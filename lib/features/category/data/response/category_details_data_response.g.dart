// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_details_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDetailsDataResponse _$CategoryDetailsDataResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryDetailsDataResponse(
      id: json['id'] as int?,
      attributes: json['attributes'] == null
          ? null
          : CategoryDetailsAttributesResponse.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryDetailsDataResponseToJson(
        CategoryDetailsDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };
