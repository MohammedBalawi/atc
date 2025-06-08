// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:act_hub_mobile/core/error_handler/error_handler.dart';
import 'package:act_hub_mobile/core/internet_checker/interent_checker.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/features/appointment/data/data_source/reservations_remote_data_source.dart';
import 'package:act_hub_mobile/features/appointment/data/mapper/reservations_mapper.dart';
import 'package:act_hub_mobile/features/appointment/domain/model/reservations_model.dart';
import 'package:act_hub_mobile/features/appointment/domain/repository/reservations_repository.dart';
import 'package:dartz/dartz.dart';

class ReservationsRepoImpl implements ReservationsRepository {
  RemoteReservationsDataSource _remoteReservationsDataSource;
  NetworkInfo _networkInfo;
  ReservationsRepoImpl(
    this._remoteReservationsDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, ReservationsModel>> reservations() async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteReservationsDataSource.getReservationsData();
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
