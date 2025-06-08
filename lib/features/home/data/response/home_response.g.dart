// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      sliders: (json['sliders'] as List<dynamic>?)
          ?.map((e) => SliderResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      courses: (json['courses'] as List<dynamic>?)
          ?.map((e) => CourseResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      resources: (json['resources'] as List<dynamic>?)
          ?.map((e) => ResourceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..message = json['message'] as String?;

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'sliders': instance.sliders,
      'categories': instance.categories,
      'courses': instance.courses,
      'resources': instance.resources,
    };
