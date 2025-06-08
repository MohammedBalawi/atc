import 'package:act_hub_mobile/features/profile/data/data_source/balance_remote_data_source.dart';
import 'package:act_hub_mobile/features/profile/data/mapper/balance_mapper.dart';
import 'package:act_hub_mobile/features/profile/domain/model/balance_model.dart';
import 'package:act_hub_mobile/features/profile/domain/repository/balance_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';

class BalanceRepoImplement implements BalanceRepository {
  BalanceRemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  BalanceRepoImplement(this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, BalanceModel>> balance() async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _remoteDataSource.balance();
        return Right(response.toDomain());
      } catch (e) {
        try {
          return Left(Failure(ResponseCode.INTERNAL_SERVER_ERROR,
              ManagerStrings.INTERNAL_SERVER_ERROR));
        } catch (e) {
          return Left(Failure(ResponseCode.UNKNOWN, ManagerStrings.UNKNOWN));
        }
      }
    } else {
      return Left(Failure(ResponseCode.NO_INTERNET_CONNECTION,
          ManagerStrings.NO_INTERNT_CONNECTION));
    }
  }
}
