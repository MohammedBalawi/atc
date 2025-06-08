// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookAppointmentResponse _$BookAppointmentResponseFromJson(
        Map<String, dynamic> json) =>
    BookAppointmentResponse(
      status: json['status'] as bool?,
    )..message = json['message'] as String?;

Map<String, dynamic> _$BookAppointmentResponseToJson(
        BookAppointmentResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
