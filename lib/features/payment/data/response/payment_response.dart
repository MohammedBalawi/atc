import 'package:act_hub_mobile/core/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';

part 'payment_response.g.dart';

@JsonSerializable()
class PaymentResponse extends BaseResponse {
  @JsonKey(name: ResponseConstants.id)
  int? id;
  String? name;

  PaymentResponse({
    required this.id,
    required this.name,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentResponseToJson(this);
}
