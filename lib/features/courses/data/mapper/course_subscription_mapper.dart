import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/courses/data/response/course_subscription_response.dart';
import 'package:act_hub_mobile/features/courses/domain/models/course_subscription_model.dart';

extension CourseSubscriptionMapper on CourseSubscriptionResponse {
  CourseSubscriptionModel toDomain() =>
      CourseSubscriptionModel(status: this.status.onNull());
}
