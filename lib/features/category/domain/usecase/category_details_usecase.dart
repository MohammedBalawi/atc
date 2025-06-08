import 'package:act_hub_mobile/features/category/data/request/category_details_request.dart';
import 'package:act_hub_mobile/features/category/domain/model/category_details_model.dart';
import 'package:act_hub_mobile/features/category/domain/repository/category_details_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/usecase/base_usecase.dart';

class CategoryDetailsUseCase
    implements BaseUseCase<CategoryDetailsRequest, CategoryDetailsModel> {
  final CategoryDetailsRepository _repository;

  CategoryDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, CategoryDetailsModel>> execute(
      CategoryDetailsRequest request) async {
    return await _repository.categoryDetails(
      CategoryDetailsRequest(
        categoryId: request.categoryId,
      ),
    );
  }
}
