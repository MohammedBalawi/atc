// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_reservation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelReservationResponse _$CancelReservationResponseFromJson(
        Map<String, dynamic> json) =>
    CancelReservationResponse(
      status: json['status'] as bool?,
    )..message = json['message'] as String?;

Map<String, dynamic> _$CancelReservationResponseToJson(
        CancelReservationResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
