import 'package:act_hub_mobile/config/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_attributes_response.g.dart';

@JsonSerializable()
class CategoryAttributeResponse {
  @JsonKey(name: ResponseConstants.name)
  String? name;
  @JsonKey(name: ResponseConstants.description)
  String? description;
  @JsonKey(name: ResponseConstants.icon)
  String? icon;
  @JsonKey(name: ResponseConstants.banner)
  String? banner;

  CategoryAttributeResponse({
    this.name,
    this.description,
    this.icon,
    this.banner,
  });

  factory CategoryAttributeResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryAttributeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryAttributeResponseToJson(this);
}
