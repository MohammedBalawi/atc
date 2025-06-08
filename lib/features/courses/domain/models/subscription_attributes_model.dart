class SubscriptionAttributesModel {
  int course_id;
  String courseImage;
  String courseName;
  String courseDescription;
  String courseDays;
  String reservationStartDate;
  String reservationEndDate;
  double reservationPrice;
  String paymentMethod;
  double reservationHours;
  double reservationLectureHours;
  bool reservationIsVerifiedPayment;

  SubscriptionAttributesModel({
    required this.course_id,
    required this.courseImage,
    required this.courseName,
    required this.courseDescription,
    required this.courseDays,
    required this.reservationStartDate,
    required this.reservationEndDate,
    required this.reservationPrice,
    required this.paymentMethod,
    required this.reservationHours,
    required this.reservationLectureHours,
    required this.reservationIsVerifiedPayment,
  });
}
