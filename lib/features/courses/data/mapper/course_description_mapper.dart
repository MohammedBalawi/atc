import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/courses/data/mapper/course_description_attributes_mapper.dart';
import 'package:act_hub_mobile/features/courses/data/response/course_description_response.dart';
import 'package:act_hub_mobile/features/courses/domain/models/course_description_model.dart';

extension CourseDescriptionMapper on CourseDescriptionResponse {
  CourseDescriptionModel toDomain() {
    return CourseDescriptionModel(
      id: this.id.onNull(),
      isRated: this.isRated.onNull(),
      userRate: this.userRate.onNull(),
      courseDescriptionAttributesModel:
          this.courseDescriptionAttributesResponse?.toDomain(),
    );
  }
}
