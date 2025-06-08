import 'package:act_hub_mobile/features/courses/domain/models/course_attributes_model.dart';

class CourseModel {
  int? id;
  bool? isRated;
  double? userRate;
  CourseAttributesModel? courseAttributesModel;

  CourseModel(
      {required this.id,
      required this.isRated,
      required this.userRate,
      required this.courseAttributesModel});
}
