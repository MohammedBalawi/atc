// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_events_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceEventsResponse _$ResourceEventsResponseFromJson(
        Map<String, dynamic> json) =>
    ResourceEventsResponse(
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
    );

Map<String, dynamic> _$ResourceEventsResponseToJson(
        ResourceEventsResponse instance) =>
    <String, dynamic>{
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };
