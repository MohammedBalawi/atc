import 'package:act_hub_mobile/config/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscription_attributes_response.g.dart';

@JsonSerializable()
class SubscriptionAttributesResponse {
  @JsonKey(name: ResponseConstants.course_id)
  int? course_id;
  @JsonKey(name: ResponseConstants.courseImage)
  String? courseImage;
  @JsonKey(name: ResponseConstants.courseName)
  String? courseName;
  @JsonKey(name: ResponseConstants.courseDescription)
  String? courseDescription;
  @JsonKey(name: ResponseConstants.courseDays)
  String? courseDays;
  @JsonKey(name: ResponseConstants.reservationStartDate)
  String? reservationStartDate;
  @JsonKey(name: ResponseConstants.reservationEndDate)
  String? reservationEndDate;
  @JsonKey(name: ResponseConstants.reservationPrice)
  double? reservationPrice;
  @JsonKey(name: ResponseConstants.paymentMethod)
  String? paymentMethod;
  @JsonKey(name: ResponseConstants.reservationHours)
  double? reservationHours;
  @JsonKey(name: ResponseConstants.reservationLectureHours)
  double? reservationLectureHours;
  @JsonKey(name: ResponseConstants.reservationIsVerifiedPayment)
  bool? reservationIsVerifiedPayment;

  SubscriptionAttributesResponse({
    this.course_id,
    this.courseImage,
    this.courseName,
    this.courseDescription,
    this.courseDays,
    this.reservationStartDate,
    this.reservationPrice,
    this.paymentMethod,
    this.reservationHours,
    this.reservationLectureHours,
    this.reservationIsVerifiedPayment,
  });

  factory SubscriptionAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$SubscriptionAttributesResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SubscriptionAttributesResponseToJson(this);
}
