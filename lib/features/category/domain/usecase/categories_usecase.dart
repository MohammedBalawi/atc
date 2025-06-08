import 'package:act_hub_mobile/core/usecase/base_usecase.dart';
import 'package:act_hub_mobile/features/category/domain/model/categories_model.dart';
import 'package:act_hub_mobile/features/category/domain/repository/categories_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';

class CategoriesUseCase implements BaseGetUseCase<CategoriesModel> {
  final CategoriesRepository _repository;

  CategoriesUseCase(this._repository);

  @override
  Future<Either<Failure, CategoriesModel>> execute() async {
    return await _repository.categories();
  }
}
