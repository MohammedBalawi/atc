import 'package:act_hub_mobile/features/resource_details/data/response/resource_details_attributes_response.dart';
import 'package:act_hub_mobile/features/resource_details/data/response/resource_reservations_response.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import '../../../../core/base_response/base_response.dart';

part 'resource_details_data_response.g.dart';

@JsonSerializable()
class ResourceDetailsDataResponse extends BaseResponse{
  @JsonKey(name: ResponseConstants.id)
  int? id;
  @JsonKey(name: ResponseConstants.attributes)
  ResourceDetailsAttributesResponse? attributes;

  @JsonKey(name: ResponseConstants.reservations)
  List<ResourceReservationsResponse>?  reservations;

  ResourceDetailsDataResponse({
    required this.id,
    required this.attributes,
    required this.reservations,
  });

  factory ResourceDetailsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ResourceDetailsDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceDetailsDataResponseToJson(this);

}