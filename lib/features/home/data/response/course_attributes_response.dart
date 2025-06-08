import 'package:act_hub_mobile/config/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_attributes_response.g.dart';

@JsonSerializable()
class CourseAttributeResponse {
  @JsonKey(name: ResponseConstants.name)
  String? name;
  @JsonKey(name: ResponseConstants.description)
  String? description;
  @JsonKey(name: ResponseConstants.resourceId)
  int? resourceId;
  @JsonKey(name: ResponseConstants.hours)
  int? hours;
  @JsonKey(name: ResponseConstants.price)
  double? price;
  @JsonKey(name: ResponseConstants.rate)
  double? rate;
  @JsonKey(name: ResponseConstants.startDate)
  String? start_date;
  @JsonKey(name: ResponseConstants.endDate)
  String? end_date;
  @JsonKey(name: ResponseConstants.avatar)
  String? avatar;

  CourseAttributeResponse({
    this.name,
    this.description,
    this.resourceId,
    this.hours,
    this.price,
    this.rate,
    this.start_date,
    this.end_date,
    this.avatar
  });

  factory CourseAttributeResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseAttributeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseAttributeResponseToJson(this);
}
