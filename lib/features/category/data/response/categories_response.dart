import 'package:act_hub_mobile/core/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import 'category_response.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse extends BaseResponse {
  @JsonKey(name: ResponseConstants.data)
  List<CategoryResponse>? data;

  CategoriesResponse({
    required this.data,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}
