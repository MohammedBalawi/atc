import 'package:act_hub_mobile/core/error_handler/error_handler.dart';
import 'package:act_hub_mobile/features/courses/data/mapper/course_rating_mapper.dart';
import 'package:act_hub_mobile/features/courses/data/request/course_rating_request.dart';
import 'package:act_hub_mobile/features/courses/domain/models/course_rating_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../domain/repository/course_rating_repository.dart';
import '../data_source/course_rating_data_source.dart';

class CourseRatingRepoImplement implements CourseRatingRepository {
  RemoteCourseRatingDataSource _remoteCourseRatingDataSource;
  NetworkInfo _networkInfo;

  CourseRatingRepoImplement(
      this._networkInfo, this._remoteCourseRatingDataSource);

  @override
  Future<Either<Failure, CourseRatingModel>> courseRating(
      CourseRatingRequest courseRatingRequest) async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _remoteCourseRatingDataSource
            .courseRating(courseRatingRequest);
        return Right(response.toDomain());
      } catch (e) {
        return Left(
          ErrorHandler.handle(e).failure,
        );
      }
    } else {
      return Left(Failure(ResponseCode.NO_INTERNET_CONNECTION,
          ManagerStrings.NO_INTERNT_CONNECTION));
    }
  }
}
