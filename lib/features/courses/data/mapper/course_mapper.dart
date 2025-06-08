import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/courses/data/mapper/course_attributes_mapper.dart';
import 'package:act_hub_mobile/features/courses/data/response/course_response.dart';
import 'package:act_hub_mobile/features/courses/domain/models/course_model.dart';

extension CourseMapper on CourseResponse {
  CourseModel toDomain() => CourseModel(
      id: this.id.onNull(),
      isRated: this.isRated.onNull(),
      userRate: this.userRate.onNull(),
      courseAttributesModel: this.attributes?.toDomain());
}
