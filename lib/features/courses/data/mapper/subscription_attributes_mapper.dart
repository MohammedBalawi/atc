import 'package:act_hub_mobile/core/extensions/extensions.dart';
import '../../domain/models/subscription_attributes_model.dart';
import '../response/subscription_attributes_response.dart';

extension SubscriptionAttributesMapper on SubscriptionAttributesResponse {
  SubscriptionAttributesModel toDomain() => SubscriptionAttributesModel(
        course_id: this.course_id.onNull(),
        courseImage: this.courseImage.onNull(),
        courseName: this.courseName.onNull(),
        courseDescription: this.courseDescription.onNull(),
        courseDays: this.courseDays.onNull(),
        reservationStartDate: this.reservationStartDate.onNull(),
        reservationEndDate: this.reservationEndDate.onNull(),
        reservationPrice: this.reservationPrice.onNull(),
        paymentMethod: this.paymentMethod.onNull(),
        reservationHours: this.reservationHours.onNull(),
        reservationLectureHours: this.reservationLectureHours.onNull(),
        reservationIsVerifiedPayment:
            this.reservationIsVerifiedPayment.onNull(),
      );
}
