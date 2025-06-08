import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import '../../../../core/base_response/base_response.dart';
part 'cancel_reservation_response.g.dart';

@JsonSerializable()
class CancelReservationResponse extends BaseResponse {
  @JsonKey(name: ResponseConstants.status)
  bool? status;

  CancelReservationResponse({required this.status});

  factory CancelReservationResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelReservationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CancelReservationResponseToJson(this);
}
