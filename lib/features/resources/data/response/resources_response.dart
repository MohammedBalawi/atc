import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import '../../../../core/base_response/base_response.dart';
import 'resource_data_response.dart';

part 'resources_response.g.dart';

@JsonSerializable()
class ResourcesResponse extends BaseResponse{
  @JsonKey(name: ResponseConstants.data)
  List<ResourceDataResponse>? data;

  ResourcesResponse({
    required this.data
  });

  factory ResourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$ResourcesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResourcesResponseToJson(this);

}