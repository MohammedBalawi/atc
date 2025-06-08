import 'package:act_hub_mobile/config/constants.dart';
import 'package:json_annotation/json_annotation.dart';
import 'resource_attributes_response.dart';

part 'resource_response.g.dart';

@JsonSerializable()
class ResourceResponse {
  @JsonKey(name: ResponseConstants.id)
  int? id;
  @JsonKey(name: ResponseConstants.attributes)
  ResourceAttributesResponse? resourceAttributesResponse;

  ResourceResponse({
    this.id,
    this.resourceAttributesResponse,
  });

  factory ResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ResourceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceResponseToJson(this);
}
