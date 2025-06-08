import 'package:act_hub_mobile/core/usecase/base_usecase.dart';
import 'package:act_hub_mobile/features/courses/domain/repository/courses_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../models/courses_model.dart';

class CoursesUseCase implements BaseGetUseCase<CoursesModel> {
  final CoursesRepository _repository;

  CoursesUseCase(this._repository);

  @override
  Future<Either<Failure, CoursesModel>> execute() async {
    return await _repository.courses();
  }
}
