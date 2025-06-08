import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/home/data/mapper/category_mapper.dart';
import 'package:act_hub_mobile/features/home/data/mapper/course_mapper.dart';
import 'package:act_hub_mobile/features/home/data/mapper/resource_mapper.dart';
import 'package:act_hub_mobile/features/home/data/response/category_response.dart';
import 'package:act_hub_mobile/features/home/data/response/course_response.dart';
import 'package:act_hub_mobile/features/home/data/response/home_response.dart';
import 'package:act_hub_mobile/features/home/data/response/resource_response.dart';
import 'package:act_hub_mobile/features/home/data/response/slider_response.dart';
import 'package:act_hub_mobile/features/home/domain/model/home_model.dart';
import 'package:act_hub_mobile/features/home/data/mapper/slider_mapper.dart';

extension HomeMapper on HomeResponse {
  HomeModel toDomain() {
    return HomeModel(
      message: this.message.onNull(),
      sliders: this
          .sliders
          ?.map(
            (SliderResponse sliderResponse) => sliderResponse.toDomain(),
          )
          .toList(),
      categories: this
          .categories
          ?.map(
            (CategoryResponse categoryResponse) => categoryResponse.toDomain(),
          )
          .toList(),
      courses: this
          .courses
          ?.map(
            (CourseResponse courseResponse) => courseResponse.toDomain(),
          )
          .toList(),
      resources: this
          .resources
          ?.map(
            (ResourceResponse resourceResponse) => resourceResponse.toDomain(),
          )
          .toList(),
    );
  }
}
