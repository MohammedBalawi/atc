import 'package:act_hub_mobile/config/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reservations_user_attributes_response.g.dart';

@JsonSerializable()
class ReservationsUserAttributesResponse {
  @JsonKey(name: ResponseConstants.resourceName)
  String? resourceName;
  @JsonKey(name: ResponseConstants.resourceImage)
  String? resourceImage;
  @JsonKey(name: ResponseConstants.categoryName)
  String? categoryName;
  @JsonKey(name: ResponseConstants.userName)
  String? userName;
  @JsonKey(name: ResponseConstants.description)
  String? description;
  @JsonKey(name: ResponseConstants.resourceId)
  int? resourceId;
  @JsonKey(name: ResponseConstants.paymentMethod)
  String? paymentMethod;
  @JsonKey(name: ResponseConstants.cost)
  double? price;
  @JsonKey(name: ResponseConstants.rate)
  double? rate;
  @JsonKey(name: ResponseConstants.avatar)
  String? avatar;
  @JsonKey(name: ResponseConstants.startDate)
  String? start_date;
  @JsonKey(name: ResponseConstants.endDate)
  String? end_date;
  @JsonKey(name: ResponseConstants.isVerifiedPayment)
  bool? isVerifiedPayment;

  ReservationsUserAttributesResponse({
    this.resourceName,
    this.resourceImage,
    this.categoryName,
    this.userName,
    this.description,
    this.resourceId,
    this.paymentMethod,
    this.price,
    this.rate,
    this.avatar,
    this.start_date,
    this.end_date,
    this.isVerifiedPayment
  });

  factory ReservationsUserAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ReservationsUserAttributesResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ReservationsUserAttributesResponseToJson(this);
}
