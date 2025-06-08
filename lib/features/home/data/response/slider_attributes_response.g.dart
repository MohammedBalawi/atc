// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_attributes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderAttributeResponse _$SliderAttributeResponseFromJson(
        Map<String, dynamic> json) =>
    SliderAttributeResponse(
      title: json['title'] as String?,
      sub_title: json['sub_title'] as String?,
      description: json['description'] as String?,
      image_url: json['image'] as String?,
      rate: json['rate'] as int?,
    );

Map<String, dynamic> _$SliderAttributeResponseToJson(
        SliderAttributeResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'sub_title': instance.sub_title,
      'description': instance.description,
      'image': instance.image_url,
      'rate': instance.rate,
    };
