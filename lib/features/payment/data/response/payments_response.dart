import 'package:act_hub_mobile/core/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import 'payment_response.dart';

part 'payments_response.g.dart';

@JsonSerializable()
class PaymentsResponse extends BaseResponse {
  @JsonKey(name: ResponseConstants.data)
  List<PaymentResponse>? data;

  PaymentsResponse({
    required this.data,
  });

  factory PaymentsResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentsResponseToJson(this);
}
