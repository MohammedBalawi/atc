import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import '../../../../core/base_response/base_response.dart';
import 'category_details_data_response.dart';
part 'category_details_response.g.dart';
@JsonSerializable()
class CategoryDetailsResponse extends BaseResponse {
  @JsonKey(name: ResponseConstants.data)
  CategoryDetailsDataResponse? data;

  CategoryDetailsResponse({
    required this.data,
  });

  factory CategoryDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDetailsResponseToJson(this);
}
