import 'package:act_hub_mobile/core/error_handler/error_handler.dart';
import 'package:act_hub_mobile/core/internet_checker/interent_checker.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/features/auth/data/data_source/remote_data_source.dart';
import 'package:act_hub_mobile/features/auth/data/mapper/fcm_token_mapper.dart';
import 'package:act_hub_mobile/features/auth/data/request/fvm_token_request.dart';
import 'package:act_hub_mobile/features/auth/domain/models/fcm_token_model.dart';
import 'package:act_hub_mobile/features/auth/domain/repository/fcm_token_repository.dart';
import 'package:dartz/dartz.dart';

class FcmTokenRepositoryImpl implements FcmTokenRepository {
  NetworkInfo _networkInfo;
  RemoteFcmTokenDataSource _remoteFcmTokenDataSource;

  FcmTokenRepositoryImpl(this._networkInfo, this._remoteFcmTokenDataSource);

  @override
  Future<Either<Failure, FcmTokenModel>> fcmToken(
      FcmTokenRequest fcmTokenRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteFcmTokenDataSource.fcmToken(
          fcmTokenRequest,
        );
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
