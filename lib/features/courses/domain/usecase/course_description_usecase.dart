import 'package:act_hub_mobile/core/error_handler/error_handler.dart';
import 'package:act_hub_mobile/core/usecase/base_usecase.dart';
import 'package:act_hub_mobile/features/courses/data/request/course_description_requset.dart';
import 'package:act_hub_mobile/features/courses/domain/repository/course_description_repository.dart';
import 'package:dartz/dartz.dart';
import '../models/course_description_data_model.dart';

class CourseDescriptionUseCase
    implements
        BaseUseCase<CourseDescriptionRequest, CourseDescriptionDataModel> {
  final CourseDescriptionRepository _repository;

  CourseDescriptionUseCase(this._repository);

  @override
  Future<Either<Failure, CourseDescriptionDataModel>> execute(
      CourseDescriptionRequest input) async {
    return await _repository.courseDescription(
      CourseDescriptionRequest(
        courseId: input.courseId,
      ),
    );
  }
}
