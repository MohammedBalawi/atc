import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';

part 'resource_events_response.g.dart';

@JsonSerializable()
class ResourceEventsResponse {
  @JsonKey(name: ResponseConstants.startDate)
  String? startDate;
  @JsonKey(name: ResponseConstants.endDate)
  String? endDate;

  ResourceEventsResponse({
    required this.startDate,
    required this.endDate,
  });

  factory ResourceEventsResponse.fromJson(Map<String, dynamic> json) =>
      _$ResourceEventsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceEventsResponseToJson(this);

}