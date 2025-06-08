import 'package:act_hub_mobile/features/courses/data/request/course_subscription_request.dart';
import 'package:act_hub_mobile/features/courses/domain/models/course_subscription_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';

abstract class CourseSubscriptionRepository {
  Future<Either<Failure, CourseSubscriptionModel>> courseSubscription(
      CourseSubscriptionRequest courseSubscriptionRequest);
}
