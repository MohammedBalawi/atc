import 'package:act_hub_mobile/core/error_handler/error_handler.dart';
import 'package:act_hub_mobile/core/internet_checker/interent_checker.dart';
import 'package:act_hub_mobile/features/home/data/data_source/remote_data_source.dart';
import 'package:act_hub_mobile/features/home/data/mapper/home_mapper.dart';
import 'package:act_hub_mobile/features/home/domain/model/home_model.dart';
import 'package:act_hub_mobile/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/resources/manager_strings.dart';

class HomeRepositoryImpl implements HomeRepository {
  RemoteHomeDataSource _remoteHomeDataSource;
  NetworkInfo _networkInfo;

  HomeRepositoryImpl(this._remoteHomeDataSource, this._networkInfo);

  @override
  Future<Either<Failure, HomeModel>> home() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteHomeDataSource.getHomeData();
        return Right(response.toDomain());
      } catch (e) {
        return Left(
            ErrorHandler.handle(e).failure
        );
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
