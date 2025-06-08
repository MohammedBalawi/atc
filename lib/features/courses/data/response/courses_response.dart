import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import '../../../../core/base_response/base_response.dart';
import 'course_response.dart';
part 'courses_response.g.dart';
@JsonSerializable()
class CoursesResponse extends BaseResponse {
  @JsonKey(name: ResponseConstants.data)
  List<CourseResponse>? data;

  CoursesResponse({required this.data});

  factory CoursesResponse.fromJson(Map<String, dynamic> json) =>
      _$CoursesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoursesResponseToJson(this);
}
