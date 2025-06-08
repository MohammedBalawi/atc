import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import 'resource_attributes_response.dart';

part 'category_details_resource_response.g.dart';

@JsonSerializable()
class CategoryDetailsResourceResponse  {
  @JsonKey(name: ResponseConstants.id)
  int? id;
  @JsonKey(name: ResponseConstants.attributes)
  ResourceAttributesResponse? attributes;

  CategoryDetailsResourceResponse({
    required this.id, required this.attributes
  });

  factory CategoryDetailsResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryDetailsResourceResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CategoryDetailsResourceResponseToJson(this);
}
