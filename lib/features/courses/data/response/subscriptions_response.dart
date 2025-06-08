import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/core/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'subscription_response.dart';

part 'subscriptions_response.g.dart';

@JsonSerializable()
class SubscriptionsResponse extends BaseResponse {
  @JsonKey(name: ResponseConstants.data)
  List<SubscriptionResponse>? data;

  SubscriptionsResponse({
    this.data,
  });

  factory SubscriptionsResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionsResponseToJson(this);
}
