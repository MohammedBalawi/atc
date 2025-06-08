import 'package:act_hub_mobile/features/courses/data/data_source/courses_remote_data_source.dart';
import 'package:act_hub_mobile/features/courses/data/mapper/courses_mapper.dart';
import 'package:act_hub_mobile/features/courses/domain/models/courses_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../domain/repository/courses_repository.dart';

class CoursesRepoImplementation implements CoursesRepository {
  RemoteCoursesDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  CoursesRepoImplementation(this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, CoursesModel>> courses() async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _remoteDataSource.courses();
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
