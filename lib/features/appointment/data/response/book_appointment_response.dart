import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import '../../../../core/base_response/base_response.dart';

part 'book_appointment_response.g.dart';

@JsonSerializable()
class BookAppointmentResponse extends BaseResponse {
  @JsonKey(name: ResponseConstants.status)
  bool? status;

  BookAppointmentResponse({required this.status});

  factory BookAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$BookAppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookAppointmentResponseToJson(this);
}
