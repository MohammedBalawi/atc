import 'package:act_hub_mobile/config/constants.dart';
import 'package:json_annotation/json_annotation.dart';
import 'subscription_attributes_response.dart';

part 'subscription_response.g.dart';

@JsonSerializable()
class SubscriptionResponse {
  @JsonKey(name: ResponseConstants.id)
  int? id;
  @JsonKey(name: ResponseConstants.status)
  String? status;
  @JsonKey(name: ResponseConstants.courseAttributeResponse)
  SubscriptionAttributesResponse? subscriptionAttributesResponse;

  SubscriptionResponse({
    this.subscriptionAttributesResponse,
    this.id,
    this.status,
  });

  factory SubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionResponseToJson(this);
}
