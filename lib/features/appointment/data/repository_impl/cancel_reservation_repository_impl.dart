import 'package:act_hub_mobile/features/appointment/data/data_source/cancel_reservation_remote_data_source.dart';
import 'package:act_hub_mobile/features/appointment/data/mapper/cancel_reservation_mapper.dart';
import 'package:act_hub_mobile/features/appointment/data/request/cancel_reservation_request.dart';
import 'package:act_hub_mobile/features/appointment/domain/model/cancel_reservation_model.dart';
import 'package:act_hub_mobile/features/appointment/domain/repository/cancel_reservation_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';

class CancelReservationRepoImpl implements CancelReservationRepository {
  CancelReservationRemoteDataSource _cancelReservationRemoteDataSource;
  NetworkInfo _networkInfo;

  CancelReservationRepoImpl(
      this._networkInfo, this._cancelReservationRemoteDataSource);

  @override
  Future<Either<Failure, CancelReservationModel>> cancelReservation(
      CancelReservationRequest cancelReservationRequest) async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _cancelReservationRemoteDataSource
            .cancelReservation(cancelReservationRequest);
        return Right(response.toDomain());
      } catch (e) {
        try {
          return Left(
            ErrorHandler.handle(e).failure,
          );
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
