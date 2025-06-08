import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import 'category_attributes_response.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  @JsonKey(name: ResponseConstants.id)
  int? id;
  @JsonKey(name: ResponseConstants.categoryAttributeResponse)
  CategoryAttributeResponse? categoryAttributeResponse;
  CategoryResponse({
    this.id,
    this.categoryAttributeResponse,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}
