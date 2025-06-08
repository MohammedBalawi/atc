// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservations_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationsUserResponse _$ReservationsUserResponseFromJson(
        Map<String, dynamic> json) =>
    ReservationsUserResponse(
      reservationsUserAttributesResponse: json['attributes'] == null
          ? null
          : ReservationsUserAttributesResponse.fromJson(
              json['attributes'] as Map<String, dynamic>),
      id: json['id'] as int?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ReservationsUserResponseToJson(
        ReservationsUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'attributes': instance.reservationsUserAttributesResponse,
    };
