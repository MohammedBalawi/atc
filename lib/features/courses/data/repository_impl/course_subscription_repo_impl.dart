import 'package:act_hub_mobile/core/error_handler/error_handler.dart';
import 'package:act_hub_mobile/features/courses/data/data_source/course_subscription_data_source.dart';
import 'package:act_hub_mobile/features/courses/data/mapper/course_subscription_mapper.dart';
import 'package:act_hub_mobile/features/courses/data/request/course_subscription_request.dart';
import 'package:act_hub_mobile/features/courses/domain/models/course_subscription_model.dart';
import 'package:act_hub_mobile/features/courses/domain/repository/course_subscription_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';

class CourseSubscriptionRepoImplement implements CourseSubscriptionRepository {
  RemoteCourseSubscriptionDataSource _remoteCourseSubscriptionDataSource;
  NetworkInfo _networkInfo;

  CourseSubscriptionRepoImplement(
    this._networkInfo,
    this._remoteCourseSubscriptionDataSource,
  );

  @override
  Future<Either<Failure, CourseSubscriptionModel>> courseSubscription(
      CourseSubscriptionRequest courseSubscriptionRequest) async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _remoteCourseSubscriptionDataSource
            .courseSubscription(courseSubscriptionRequest);
        return Right(
          response.toDomain(),
        );
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
