import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/core/base_response/base_response.dart';
import 'package:act_hub_mobile/features/appointment/data/response/reservations_user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reservations_response.g.dart';

@JsonSerializable()
class ReservationsResponse extends BaseResponse {
  @JsonKey(name: ResponseConstants.data)
  List<ReservationsUserResponse>? reservationsUserResponse;

  ReservationsResponse({
    this.reservationsUserResponse,
  });
  factory ReservationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ReservationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationsResponseToJson(this);
}
