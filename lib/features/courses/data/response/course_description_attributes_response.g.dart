// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_description_attributes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDescriptionAttributesResponse
    _$CourseDescriptionAttributesResponseFromJson(Map<String, dynamic> json) =>
        CourseDescriptionAttributesResponse(
          name: json['name'] as String?,
          description: json['description'] as String?,
          active: json['active'] as int?,
          resourceId: json['resource_id'] as int?,
          hours: json['hours'] as int?,
          price: (json['price'] as num?)?.toDouble(),
          rate: (json['rate'] as num?)?.toDouble(),
          start_date: json['start_date'] as String?,
          end_date: json['end_date'] as String?,
          avatar: json['avatar'] as String?,
        );

Map<String, dynamic> _$CourseDescriptionAttributesResponseToJson(
        CourseDescriptionAttributesResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'active': instance.active,
      'resource_id': instance.resourceId,
      'hours': instance.hours,
      'price': instance.price,
      'rate': instance.rate,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'avatar': instance.avatar,
    };
