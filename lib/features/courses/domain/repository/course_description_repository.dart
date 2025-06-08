import 'package:act_hub_mobile/core/error_handler/error_handler.dart';
import 'package:act_hub_mobile/features/courses/data/request/course_description_requset.dart';
import 'package:dartz/dartz.dart';

import '../models/course_description_data_model.dart';

abstract class CourseDescriptionRepository {
  Future<Either<Failure, CourseDescriptionDataModel>> courseDescription(
      CourseDescriptionRequest courseDescriptionRequest);
}
