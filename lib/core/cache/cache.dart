import 'package:act_hub_mobile/features/courses/domain/models/course_description_model.dart';
import 'package:act_hub_mobile/features/payment/domain/model/payments_model.dart';
import '../../features/appointment/domain/model/event_model.dart';
import '../../features/appointment/domain/model/reservations_user_attribute_model.dart';
import '../../features/category/domain/model/category_details_resource_model.dart';

class CacheData {
  static String email = "";
  static String username = "";
  static String phone = "";
  static int courseId = 0;
  static int categoryId = 0;
  static int resourceId = 0;
  static int reservationId = -1;
  static int subscriptionId = -1;
  static CourseDescriptionModel courseDescriptionModel =
      CourseDescriptionModel();
  static ReservationsUserAttributeModel reservationsUserAttributeModel =
      ReservationsUserAttributeModel();
  static CategoryDetailsResourceModel categoryDetailsResourceModel =
      CategoryDetailsResourceModel();
  static PaymentsModel paymentsModel = PaymentsModel(
    data: [],
  );
  static bool hasPayments = false;
  static List<EventModel> events = [];

  void setEvents(List<EventModel> value) {
    events = value;
  }

  List<EventModel> getEvents() {
    return events;
  }

  void setResourceId(int id) {
    resourceId = id;
  }

  int getResourceId() {
    return resourceId;
  }

  void setReservationId(int id) {
    reservationId = id;
  }

  int getReservationId() {
    return reservationId;
  }

  void setSubscriptionId(int id) {
    subscriptionId = id;
  }

  int getSubscriptionId() {
    return subscriptionId;
  }

  void setEmail(String value) {
    CacheData.email = value;
  }

  String getEmail() {
    return email;
  }

  void setUsername(String value) {
    CacheData.username = value;
  }

  String getUsername() {
    return username;
  }

  void setPhone(String value) {
    CacheData.phone = value;
  }

  String getPhone() {
    return phone;
  }

  void setCourseId(int? id) {
    courseId = id!;
  }

  int getCourseId() {
    return courseId;
  }

  void setCategoryId(int? id) {
    categoryId = id!;
  }

  int getCategoryId() {
    return categoryId;
  }

  void setCourseDetails(CourseDescriptionModel courseDescriptionModel) {
    CacheData.courseDescriptionModel = courseDescriptionModel;
  }

  CourseDescriptionModel getCourseDetails() {
    return courseDescriptionModel;
  }

  void setUserReservationDetails(ReservationsUserAttributeModel details) {
    reservationsUserAttributeModel = details;
  }

  ReservationsUserAttributeModel getUserReservationDetails() {
    return reservationsUserAttributeModel;
  }

  void setResourceDetails(CategoryDetailsResourceModel detailsResourceModel) {
    categoryDetailsResourceModel = detailsResourceModel;
  }

  CategoryDetailsResourceModel getResourceDetails() {
    return categoryDetailsResourceModel;
  }

  void setPaymentMethods(PaymentsModel paymentsModel) {
    CacheData.paymentsModel = paymentsModel;
  }

  PaymentsModel getPaymentMethods() {
    return paymentsModel;
  }

  void setHasPaymentMethods() {
    CacheData.hasPayments = true;
  }

  void disposeHasPaymentMethods() {
    CacheData.hasPayments = false;
  }

  bool getHasPaymentMethods() {
    return hasPayments;
  }
}
