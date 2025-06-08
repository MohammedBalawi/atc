import 'package:act_hub_mobile/core/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../config/constants.dart';
part 'course_rating_response.g.dart';

@JsonSerializable()
class CourseRatingResponse extends BaseResponse{
  @JsonKey(name: ResponseConstants.status)
  bool? status;

  CourseRatingResponse({required this.status});

  factory CourseRatingResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseRatingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseRatingResponseToJson(this);
}