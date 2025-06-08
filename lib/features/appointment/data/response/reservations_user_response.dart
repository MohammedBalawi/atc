import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/features/appointment/data/response/reservations_user_attributes_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reservations_user_response.g.dart';

@JsonSerializable()
class ReservationsUserResponse {
  @JsonKey(name: ResponseConstants.id)
  int? id;
  @JsonKey(name: ResponseConstants.status)
  String? status;
  @JsonKey(name: ResponseConstants.courseAttributeResponse)
  ReservationsUserAttributesResponse? reservationsUserAttributesResponse;
  ReservationsUserResponse({
    this.reservationsUserAttributesResponse,
    this.id,
    this.status
  });
  factory ReservationsUserResponse.fromJson(Map<String, dynamic> json) =>
      _$ReservationsUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationsUserResponseToJson(this);
}
