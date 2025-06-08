import 'package:act_hub_mobile/features/resources/data/response/resource_attributes_response.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import '../../../../core/base_response/base_response.dart';
import 'resource_reservations_response.dart';

part 'resource_data_response.g.dart';

@JsonSerializable()
class ResourceDataResponse extends BaseResponse{
  @JsonKey(name: ResponseConstants.id)
  int? id;
  @JsonKey(name: ResponseConstants.attributes)
  ResourceAttributesResponse? attributes;

  @JsonKey(name: ResponseConstants.reservations)
  List<ResourceReservationsResponse>?  reservations;

  ResourceDataResponse({
    required this.id,
    required this.attributes,
    required this.reservations,
  });

  factory ResourceDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ResourceDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceDataResponseToJson(this);

}