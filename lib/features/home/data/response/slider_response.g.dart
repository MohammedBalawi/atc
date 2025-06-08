// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderResponse _$SliderResponseFromJson(Map<String, dynamic> json) =>
    SliderResponse(
      id: json['id'] as int?,
      type: json['type'] as String?,
      sliderAttributeResponse: json['attributes'] == null
          ? null
          : SliderAttributeResponse.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SliderResponseToJson(SliderResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.sliderAttributeResponse,
    };
