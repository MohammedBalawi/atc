import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../model/resources_model.dart';
import '../repository/resources_repository.dart';

class ResourcesUseCase implements BaseGetUseCase<ResourcesModel> {
  final ResourcesRepository _repository;

  ResourcesUseCase(this._repository);

  @override
  Future<Either<Failure, ResourcesModel>> execute() async {
    return await _repository.resources();
  }
}
