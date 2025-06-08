import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import 'category_details_attributes_response.dart';

part 'category_details_data_response.g.dart';

@JsonSerializable()
class CategoryDetailsDataResponse  {
  @JsonKey(name: ResponseConstants.id)
  int? id;
  @JsonKey(name: ResponseConstants.attributes)
  CategoryDetailsAttributesResponse? attributes;

  CategoryDetailsDataResponse({
    required this.id,required this.attributes
  });

  factory CategoryDetailsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryDetailsDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDetailsDataResponseToJson(this);
}
