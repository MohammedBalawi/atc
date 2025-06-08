import 'package:act_hub_mobile/features/courses/domain/models/course_description_attributes_model.dart';

class CourseDescriptionModel {
  int? id;
  bool? isRated;
  double? userRate;
  CourseDescriptionAttributesModel? courseDescriptionAttributesModel;

  CourseDescriptionModel({
    this.id,
    this.isRated,
    this.userRate,
    this.courseDescriptionAttributesModel,
  });
}
