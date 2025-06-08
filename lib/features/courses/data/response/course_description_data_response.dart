


import 'package:json_annotation/json_annotation.dart';

import '../../../../config/constants.dart';
import '../../../../core/base_response/base_response.dart';
import 'course_description_response.dart';
part 'course_description_data_response.g.dart';

@JsonSerializable()
class CourseDescriptionDataResponse extends BaseResponse {
  @JsonKey(name: ResponseConstants.data)
  CourseDescriptionResponse? data;

  CourseDescriptionDataResponse({
    required this.data
  });

  factory CourseDescriptionDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseDescriptionDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDescriptionDataResponseToJson(this);
}
