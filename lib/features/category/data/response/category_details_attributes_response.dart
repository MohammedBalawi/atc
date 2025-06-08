import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import 'category_details_resource_response.dart';

part 'category_details_attributes_response.g.dart';

@JsonSerializable()
class CategoryDetailsAttributesResponse {
  @JsonKey(name: ResponseConstants.name)
  String? name;
  @JsonKey(name: ResponseConstants.description)
  String? description;
  @JsonKey(name: ResponseConstants.icon)
  String? icon;
  @JsonKey(name: ResponseConstants.banner)
  String? banner;
  @JsonKey(name: ResponseConstants.resource)
  List<CategoryDetailsResourceResponse>? resources;

  CategoryDetailsAttributesResponse({
    required this.name,
    required this.description,
    required this.icon,
    required this.banner,
    required this.resources,
  });

  factory CategoryDetailsAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CategoryDetailsAttributesResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CategoryDetailsAttributesResponseToJson(this);
}
