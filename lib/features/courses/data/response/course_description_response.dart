import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/features/courses/data/response/course_description_attributes_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'course_description_response.g.dart';

@JsonSerializable()
class CourseDescriptionResponse {
  @JsonKey(name: ResponseConstants.courseId)
  int? id;
  @JsonKey(name: ResponseConstants.isRated)
  bool? isRated;
  @JsonKey(name: ResponseConstants.userRate)
  double? userRate;
  @JsonKey(name: ResponseConstants.attributes)
  CourseDescriptionAttributesResponse? courseDescriptionAttributesResponse;

  CourseDescriptionResponse({
    this.id,
    this.userRate,
    this.isRated,
    this.courseDescriptionAttributesResponse,
  });

  factory CourseDescriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseDescriptionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDescriptionResponseToJson(this);
}
