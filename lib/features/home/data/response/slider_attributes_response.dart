import 'package:act_hub_mobile/config/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'slider_attributes_response.g.dart';

@JsonSerializable()
class SliderAttributeResponse {
  @JsonKey(name: ResponseConstants.title)
  String? title;
  @JsonKey(name: ResponseConstants.subTitle)
  String? sub_title;
  @JsonKey(name: ResponseConstants.description)
  String? description;
  @JsonKey(name: ResponseConstants.image)
  String? image_url;
  @JsonKey(name: ResponseConstants.rate)
  int? rate;

  SliderAttributeResponse({
   this.title,
   this.sub_title,
   this.description,
   this.image_url,
   this.rate,
  });

  factory SliderAttributeResponse.fromJson(Map<String, dynamic> json) =>
      _$SliderAttributeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SliderAttributeResponseToJson(this);
}
