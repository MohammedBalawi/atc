// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationsResponse _$ReservationsResponseFromJson(
        Map<String, dynamic> json) =>
    ReservationsResponse(
      reservationsUserResponse: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              ReservationsUserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..message = json['message'] as String?;

Map<String, dynamic> _$ReservationsResponseToJson(
        ReservationsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.reservationsUserResponse,
    };
