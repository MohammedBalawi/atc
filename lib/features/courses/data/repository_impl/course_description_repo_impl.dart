import 'package:act_hub_mobile/core/error_handler/error_handler.dart';
import 'package:act_hub_mobile/core/internet_checker/interent_checker.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/features/courses/data/data_source/course_description_data_source.dart';
import 'package:act_hub_mobile/features/courses/data/mapper/course_description_data_mapper.dart';
import 'package:act_hub_mobile/features/courses/data/request/course_description_requset.dart';
import 'package:act_hub_mobile/features/courses/domain/models/course_description_data_model.dart';
import 'package:act_hub_mobile/features/courses/domain/repository/course_description_repository.dart';
import 'package:dartz/dartz.dart';

class CourseDescriptionRepoImplement implements CourseDescriptionRepository {
  RemoteCourseDescriptionDataSource _remoteCourseDescriptionDataSource;
  NetworkInfo _networkInfo;

  CourseDescriptionRepoImplement(
      this._networkInfo, this._remoteCourseDescriptionDataSource);

  @override
  Future<Either<Failure, CourseDescriptionDataModel>> courseDescription(
      CourseDescriptionRequest courseDescriptionRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteCourseDescriptionDataSource
            .courseDescription(courseDescriptionRequest);
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
