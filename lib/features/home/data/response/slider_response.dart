import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/features/home/data/response/slider_attributes_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'slider_response.g.dart';

@JsonSerializable()
class SliderResponse {
  @JsonKey(name: ResponseConstants.id)
  int? id;
  @JsonKey(name: ResponseConstants.type)
  String? type;
  @JsonKey(name: ResponseConstants.sliderAttributeResponse)
  SliderAttributeResponse? sliderAttributeResponse;

  SliderResponse({
    this.id,
    this.type,
   this.sliderAttributeResponse,
  });

  factory SliderResponse.fromJson(Map<String, dynamic> json) =>
      _$SliderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SliderResponseToJson(this);
}
