import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import 'course_attributes_response.dart';

part 'course_response.g.dart';

@JsonSerializable()
class CourseResponse {
  @JsonKey(name: ResponseConstants.id)
  int? id;
  @JsonKey(name: ResponseConstants.isRated)
  bool? isRated;
  @JsonKey(name: ResponseConstants.userRate)
  double? userRate;
  @JsonKey(name: ResponseConstants.attributes)
  CourseAttributesResponse? attributes;

  CourseResponse(
      {required this.id, required this.isRated, required this.userRate});

  factory CourseResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseResponseToJson(this);
}
