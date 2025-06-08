import 'package:act_hub_mobile/features/resources/data/mapper/resources_mapper.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../data/data_source/resources_remote_data_source.dart';
import '../model/resources_model.dart';

abstract class ResourcesRepository {
  Future<Either<Failure, ResourcesModel>> resources();
}

class ResourcesRepositoryImpl implements ResourcesRepository {
  RemoteResourcesDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  ResourcesRepositoryImpl(this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, ResourcesModel>> resources() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.resources();
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          ResponseCode.NO_INTERNET_CONNECTION,
          ManagerStrings.NO_INTERNT_CONNECTION,
        ),
      );
    }
  }
}
