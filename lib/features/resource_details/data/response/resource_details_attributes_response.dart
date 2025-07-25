import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import '../../../../core/base_response/base_response.dart';

part 'resource_details_attributes_response.g.dart';

@JsonSerializable()
class ResourceDetailsAttributesResponse extends BaseResponse {
  @JsonKey(name: ResponseConstants.name)
  String? name;
  @JsonKey(name: ResponseConstants.numberSeats)
  int? numberSeats;
  @JsonKey(name: ResponseConstants.thumbnailImage)
  String? thumbnailImage;
  @JsonKey(name: ResponseConstants.priceByHour)
  int? priceByHour;
  @JsonKey(name: ResponseConstants.priceByDay)
  int? priceByDay;
  @JsonKey(name: ResponseConstants.priceByWeek)
  int? priceByWeek;
  @JsonKey(name: ResponseConstants.priceByMonth)
  int? priceByMonth;
  @JsonKey(name: ResponseConstants.description)
  String? description;

  ResourceDetailsAttributesResponse(
      {required this.name,
      required this.numberSeats,
      required this.thumbnailImage,
      required this.priceByHour,
      required this.priceByDay,
      required this.priceByWeek,
      required this.priceByMonth,
      required this.description});

  factory ResourceDetailsAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ResourceDetailsAttributesResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ResourceDetailsAttributesResponseToJson(this);
}
