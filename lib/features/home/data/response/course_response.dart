import 'package:act_hub_mobile/config/constants.dart';
import 'package:json_annotation/json_annotation.dart';
import 'course_attributes_response.dart';

part 'course_response.g.dart';

@JsonSerializable()
class CourseResponse {
  @JsonKey(name: ResponseConstants.id)
  int? id;
  @JsonKey(name: ResponseConstants.courseAttributeResponse)
  CourseAttributeResponse? courseAttributeResponse;

  CourseResponse({
    this.id,
    this.courseAttributeResponse,
  });

  factory CourseResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseResponseToJson(this);
}
