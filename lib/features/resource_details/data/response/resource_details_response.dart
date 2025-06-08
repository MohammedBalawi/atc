import 'package:act_hub_mobile/features/resource_details/data/response/resource_details_data_response.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import '../../../../core/base_response/base_response.dart';

part 'resource_details_response.g.dart';

@JsonSerializable()
class ResourceDetailsResponse extends BaseResponse{
  @JsonKey(name: ResponseConstants.data)
  ResourceDetailsDataResponse? data;

  ResourceDetailsResponse({
    required this.data
  });

  factory ResourceDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ResourceDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceDetailsResponseToJson(this);

}