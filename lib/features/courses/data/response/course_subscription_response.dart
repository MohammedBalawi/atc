
import 'package:act_hub_mobile/core/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../config/constants.dart';
part 'course_subscription_response.g.dart';

@JsonSerializable()
class CourseSubscriptionResponse extends BaseResponse{
  @JsonKey(name: ResponseConstants.status)
  bool? status;

  CourseSubscriptionResponse({required this.status});

  factory CourseSubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseSubscriptionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseSubscriptionResponseToJson(this);
}