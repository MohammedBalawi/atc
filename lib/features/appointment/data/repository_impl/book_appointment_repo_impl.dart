import 'package:act_hub_mobile/features/appointment/data/data_source/book_appointment_remote_data_source.dart';
import 'package:act_hub_mobile/features/appointment/data/mapper/book_appointment_mapper.dart';
import 'package:act_hub_mobile/features/appointment/data/request/book_appointment_request.dart';
import 'package:act_hub_mobile/features/appointment/domain/model/book_appointment_model.dart';
import 'package:act_hub_mobile/features/appointment/domain/repository/book_appointment_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';

class BookAppointmentRepoImplement implements BookAppointmentRepository {
  RemoteBookAppointmentDataSource _remoteBookAppointmentDataSource;
  NetworkInfo _networkInfo;

  BookAppointmentRepoImplement(
    this._networkInfo,
    this._remoteBookAppointmentDataSource,
  );

  @override
  Future<Either<Failure, BookAppointmentModel>> bookAppointment(
      BookAppointmentRequest bookAppointmentRequest) async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _remoteBookAppointmentDataSource
            .bookAppointment(bookAppointmentRequest);
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
