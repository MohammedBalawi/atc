import 'package:act_hub_mobile/features/resource_details/data/request/resource_details_request.dart';
import 'package:act_hub_mobile/features/resource_details/domain/models/resource_details_model.dart';
import 'package:act_hub_mobile/features/resource_details/domain/repository/resource_details_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/usecase/base_usecase.dart';

class ResourceDetailsUseCase
    implements BaseUseCase<ResourceDetailsRequest, ResourceDetailsModel> {
  final ResourceDetailsRepository _repository;

  ResourceDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, ResourceDetailsModel>> execute(
      ResourceDetailsRequest input) async {
    return await _repository.resourceDetails(
      ResourceDetailsRequest(
        resourceId: input.resourceId,
      ),
    );
  }
}
