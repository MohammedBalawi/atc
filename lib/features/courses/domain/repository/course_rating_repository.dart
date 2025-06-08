import 'package:act_hub_mobile/features/courses/data/request/course_rating_request.dart';
import 'package:act_hub_mobile/features/courses/domain/models/course_rating_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';

abstract class CourseRatingRepository {
  Future<Either<Failure, CourseRatingModel>> courseRating(
      CourseRatingRequest courseRatingRequest);
}
