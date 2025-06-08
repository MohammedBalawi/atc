import 'package:act_hub_mobile/features/home/data/response/category_attributes_response.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  @JsonKey(name: ResponseConstants.id)
  int? id;
  @JsonKey(name: ResponseConstants.type)
  String? type;
  @JsonKey(name: ResponseConstants.categoryAttributeResponse)
  CategoryAttributeResponse? categoryAttributeResponse;

  CategoryResponse({
    this.id,
    this.type,
    this.categoryAttributeResponse,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}
