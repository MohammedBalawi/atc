import 'package:act_hub_mobile/core/base_model/base_model.dart';
import 'course_model.dart';

class CoursesModel extends BaseModel {
  List<CourseModel>? data;

  CoursesModel({required this.data, required super.message});
}
