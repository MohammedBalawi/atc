import 'package:act_hub_mobile/features/courses/data/request/course_rating_request.dart';
import 'package:act_hub_mobile/features/courses/domain/repository/course_rating_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../models/course_rating_model.dart';

class CourseRatingUseCase
    implements BaseUseCase<CourseRatingRequest, CourseRatingModel> {
  final CourseRatingRepository _repository;

  CourseRatingUseCase(this._repository);

  @override
  Future<Either<Failure, CourseRatingModel>> execute(
      CourseRatingRequest input) async {
    return await _repository.courseRating(
      CourseRatingRequest(
        courseId: input.courseId,
        value: input.value,
      ),
    );
  }
}
