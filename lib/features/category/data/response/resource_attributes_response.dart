import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';

part 'resource_attributes_response.g.dart';

@JsonSerializable()
class ResourceAttributesResponse {
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
  int? priceByWeak;
  @JsonKey(name: ResponseConstants.priceByMonth)
  int? priceByMonth;

  ResourceAttributesResponse({
    required this.name,
    required this.numberSeats,
    required this.thumbnailImage,
    required this.priceByHour,
    required this.priceByDay,
    required this.priceByWeak,
    required this.priceByMonth,
  });

  factory ResourceAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$ResourceAttributesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceAttributesResponseToJson(this);
}
