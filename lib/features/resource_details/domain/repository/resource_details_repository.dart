import 'package:act_hub_mobile/features/resource_details/data/mapper/resource_details_mapper.dart';
import 'package:act_hub_mobile/features/resource_details/data/request/resource_details_request.dart';
import 'package:act_hub_mobile/features/resource_details/domain/models/resource_details_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../data/data_source/resource_details_remote_data_source.dart';

abstract class ResourceDetailsRepository {
  Future<Either<Failure, ResourceDetailsModel>> resourceDetails(
      ResourceDetailsRequest request);
}

class ResourceDetailsRepositoryImpl implements ResourceDetailsRepository {
  RemoteResourceDetailsDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  ResourceDetailsRepositoryImpl(this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, ResourceDetailsModel>> resourceDetails(
      ResourceDetailsRequest request) async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _remoteDataSource.resourceDetails(request);
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(Failure(ResponseCode.NO_INTERNET_CONNECTION,
          ManagerStrings.NO_INTERNT_CONNECTION));
    }
  }
}
