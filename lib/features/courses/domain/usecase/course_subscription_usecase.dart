import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/request/course_subscription_request.dart';
import '../models/course_subscription_model.dart';
import '../repository/course_subscription_repository.dart';

class CourseSubscriptionUseCase
    implements BaseUseCase<CourseSubscriptionRequest, CourseSubscriptionModel> {
  final CourseSubscriptionRepository _repository;

  CourseSubscriptionUseCase(this._repository);

  @override
  Future<Either<Failure, CourseSubscriptionModel>> execute(
      CourseSubscriptionRequest input) async {
    return await _repository.courseSubscription(
      CourseSubscriptionRequest(
        courseId: input.courseId,
        paymentMethodId: input.paymentMethodId,
      ),
    );
  }
}
