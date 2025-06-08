// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_reservations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceReservationsResponse _$ResourceReservationsResponseFromJson(
        Map<String, dynamic> json) =>
    ResourceReservationsResponse(
      events: (json['events'] as List<dynamic>?)
          ?.map(
              (e) => ResourceEventsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      color: json['color'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ResourceReservationsResponseToJson(
        ResourceReservationsResponse instance) =>
    <String, dynamic>{
      'events': instance.events,
      'color': instance.color,
      'title': instance.title,
    };
