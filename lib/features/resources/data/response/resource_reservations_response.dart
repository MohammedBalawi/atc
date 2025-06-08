
import 'package:json_annotation/json_annotation.dart';

import '../../../../config/constants.dart';
import 'resource_events_response.dart';

part 'resource_reservations_response.g.dart';

@JsonSerializable()
class ResourceReservationsResponse {
  @JsonKey(name: ResponseConstants.events)
  List<ResourceEventsResponse>? events;
  @JsonKey(name: ResponseConstants.color)
  String? color;
  @JsonKey(name: ResponseConstants.title)
  String? title;

  ResourceReservationsResponse({
    required this.events,
    required this.color,
    required this.title,
  });

  factory ResourceReservationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ResourceReservationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceReservationsResponseToJson(this);
}
