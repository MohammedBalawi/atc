import 'package:act_hub_mobile/core/base_response/base_response.dart';
import 'package:act_hub_mobile/features/home/data/response/resource_response.dart';
import 'package:act_hub_mobile/features/home/data/response/slider_response.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../config/constants.dart';
import 'category_response.dart';
import 'course_response.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse extends BaseResponse {
  @JsonKey(name: ResponseConstants.sliders)
  List<SliderResponse>? sliders;
  @JsonKey(name: ResponseConstants.categories)
  List<CategoryResponse>? categories;
  @JsonKey(name: ResponseConstants.courses)
  List<CourseResponse>? courses;
  @JsonKey(name: ResponseConstants.resources)
  List<ResourceResponse>? resources;

  HomeResponse({
    this.sliders,
    this.categories,
    this.courses,
    this.resources,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}
