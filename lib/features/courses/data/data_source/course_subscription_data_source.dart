import 'package:act_hub_mobile/features/courses/data/request/course_subscription_request.dart';
import 'package:act_hub_mobile/features/courses/data/response/course_subscription_response.dart';
import '../../../../core/network/app_api.dart';

abstract class RemoteCourseSubscriptionDataSource{
  Future<CourseSubscriptionResponse> courseSubscription(CourseSubscriptionRequest courseSubscriptionRequest);
}

class RemoteCourseSubscriptionDataSourceImplement implements RemoteCourseSubscriptionDataSource {
  AppService _appService;

  RemoteCourseSubscriptionDataSourceImplement(this._appService);

  @override
  Future<CourseSubscriptionResponse> courseSubscription(CourseSubscriptionRequest courseSubscriptionRequest) async{
    return await _appService.courseSubscription(courseSubscriptionRequest.courseId, courseSubscriptionRequest.paymentMethodId);
  }
}