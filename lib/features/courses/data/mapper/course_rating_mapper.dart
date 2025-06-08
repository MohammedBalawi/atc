import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/courses/data/response/course_rating_response.dart';
import 'package:act_hub_mobile/features/courses/domain/models/course_rating_model.dart';

extension CourseRatingMapper on CourseRatingResponse {
  CourseRatingModel toDomain() =>
      CourseRatingModel(status: this.status.onNull());
}
