import 'package:act_hub_mobile/core/base_model/base_model.dart';
import 'package:act_hub_mobile/features/home/domain/model/category_model.dart';
import 'package:act_hub_mobile/features/home/domain/model/course_model.dart';
import 'package:act_hub_mobile/features/home/domain/model/resource_model.dart';
import 'package:act_hub_mobile/features/home/domain/model/slider_model.dart';

class HomeModel extends BaseModel {
  List<SliderModel>? sliders;
  List<CategoryModel>? categories;
  List<CourseModel>? courses;
  List<ResourceModel>? resources;

  HomeModel({
    this.sliders,
    this.categories,
    this.courses,
    this.resources,
    super.message,
  });
}
