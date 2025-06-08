import 'package:act_hub_mobile/core/error_handler/error_handler.dart';
import 'package:act_hub_mobile/core/internet_checker/interent_checker.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/features/courses/data/data_source/subscriptions_remote_data_source.dart';
import 'package:act_hub_mobile/features/courses/data/mapper/subscriptions_mapper.dart';
import 'package:dartz/dartz.dart';
import '../../domain/models/subscriptions_model.dart';
import '../../domain/repository/subscriptions_repository.dart';

class SubscriptionsRepoImpl implements SubscriptionsRepository {
  SubscriptionsRemoteDataSource _remoteSubscriptionsDataSource;
  NetworkInfo _networkInfo;

  SubscriptionsRepoImpl(
    this._remoteSubscriptionsDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, SubscriptionsModel>> subscriptions() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteSubscriptionsDataSource.subscriptions();
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
