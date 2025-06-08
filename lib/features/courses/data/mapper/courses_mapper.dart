import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/courses/data/mapper/course_mapper.dart';
import 'package:act_hub_mobile/features/courses/data/response/courses_response.dart';
import 'package:act_hub_mobile/features/courses/domain/models/courses_model.dart';
import '../response/course_response.dart';

extension CoursesMapper on CoursesResponse {
  CoursesModel toDomain() => CoursesModel(
      data:
          this.data?.map((CourseResponse course) => course.toDomain()).toList(),
      message: this.message.onNull());
}
