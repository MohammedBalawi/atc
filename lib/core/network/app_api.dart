import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/config/request_constants.dart';
import 'package:act_hub_mobile/features/appointment/data/response/book_appointment_response.dart';
import 'package:act_hub_mobile/features/appointment/data/response/cancel_reservation_response.dart';
import 'package:act_hub_mobile/features/appointment/data/response/reservations_response.dart';
import 'package:act_hub_mobile/features/auth/data/response/fcm_token_response.dart';
import 'package:act_hub_mobile/features/auth/data/response/register_response.dart';
import 'package:act_hub_mobile/features/category/data/response/categories_response.dart';
import 'package:act_hub_mobile/features/category/data/response/category_details_response.dart';
import 'package:act_hub_mobile/features/courses/data/response/course_rating_response.dart';
import 'package:act_hub_mobile/features/courses/data/response/course_subscription_response.dart';
import 'package:act_hub_mobile/features/courses/data/response/courses_response.dart';
import 'package:act_hub_mobile/features/edit_profile/data/response/edit_name_response.dart';
import 'package:act_hub_mobile/features/edit_profile/data/response/edit_phone_response.dart';
import 'package:act_hub_mobile/features/edit_profile/data/response/profile_response.dart';
import 'package:act_hub_mobile/features/notifications/data/response/notifications_response.dart';
import 'package:act_hub_mobile/features/profile/data/response/balance_response.dart';
import 'package:act_hub_mobile/features/profile/data/response/edit_password_response.dart';
import 'package:act_hub_mobile/features/resource_details/data/response/resource_details_response.dart';
import 'package:act_hub_mobile/features/resources/data/response/resources_response.dart';
import 'package:act_hub_mobile/features/verification/data/response/verify_email_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/auth/data/response/login_response.dart';
import '../../features/auth/data/response/logout_response.dart';
import '../../features/courses/data/response/course_description_data_response.dart';
import '../../features/courses/data/response/subscriptions_response.dart';
import '../../features/forget_password/data/response/forget_password_response.dart';
import '../../features/home/data/response/home_response.dart';
import '../../features/payment/data/response/payments_response.dart';
import '../../features/reset_password/data/response/reset_password_response.dart';
import '../../features/verification/data/response/send_otp_response.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppService {
  factory AppService(Dio dio, {String baseUrl}) = _AppService;

  // Login Request
  @POST(RequestsConstants.loginRequest)
  Future<LoginResponse> login(@Field(RequestsConstants.email) String email,
      @Field(RequestsConstants.password) String password);

  @POST(RequestsConstants.registerRequest)
  Future<RegisterResponse> register(
      @Field(RequestsConstants.name) String fullName,
      @Field(RequestsConstants.email) String email,
      @Field(RequestsConstants.phoneNumber) String phone,
      @Field(RequestsConstants.password) String password,
      @Field(RequestsConstants.passwordConfirmation) String confirmPassword);

  @POST(RequestsConstants.forgetPasswordRequest)
  Future<ForgetPasswordResponse> forgetPassword(
    @Field(RequestsConstants.email) String email,
  );

  @POST(RequestsConstants.sendOtp)
  Future<SendOtpResponse> sendOtp(
    @Field(RequestsConstants.email) String email,
  );

  @POST(RequestsConstants.verifyEmail)
  Future<VerifyEmailResponse> verifyEmail(
      @Field(RequestsConstants.email) String email,
      @Field(RequestsConstants.otp) String otp);

  @POST(RequestsConstants.logout)
  Future<LogoutResponse> logout();

  @GET(RequestsConstants.homeRequest)
  Future<HomeResponse> home();

  @POST(RequestsConstants.editName)
  Future<EditUserNameResponse> editName(
    @Field(RequestsConstants.name) String name,
  );

  @POST(RequestsConstants.editPhone)
  Future<EditUserPhoneResponse> editPhone(
    @Field(RequestsConstants.phoneNumber) String phone,
  );

  @POST(RequestsConstants.courseRating)
  Future<CourseRatingResponse> courseRating(
    @Field(RequestsConstants.courseId) int courseId,
    @Field(RequestsConstants.value) double val,
  );

  @POST(RequestsConstants.courseSubscription)
  Future<CourseSubscriptionResponse> courseSubscription(
    @Field(RequestsConstants.courseId) int courseId,
    @Field(RequestsConstants.paymentMethodId) int paymentMethodId,
  );

  @POST(RequestsConstants.bookAppointment)
  Future<BookAppointmentResponse> bookAppointment(
    @Field(RequestsConstants.pricingOption) String pricingOption,
    @Field(RequestsConstants.pricingInput) int pricingInput,
    @Field(RequestsConstants.resourceId) int resourceId,
    @Field(RequestsConstants.startDate) String startDate,
    @Field(RequestsConstants.paymentMethodId) int paymentMethodId,
  );

  @GET(RequestsConstants.profile)
  Future<ProfileResponse> profile();

  @GET(RequestsConstants.categories)
  Future<CategoriesResponse> categories();

  @GET(RequestsConstants.courses)
  Future<CoursesResponse> courses();

  @POST(RequestsConstants.courseDescription)
  Future<CourseDescriptionDataResponse> courseDescription(
      @Field(RequestsConstants.courseId) int courseId);

  @GET(RequestsConstants.getReservations)
  Future<ReservationsResponse> reservations();

  @POST(RequestsConstants.editPassword)
  Future<EditPasswordResponse> editPassword(
    @Field(RequestsConstants.password) password,
    @Field(RequestsConstants.passwordConfirmation) passwordConfirmation,
  );

  @POST(RequestsConstants.resetPassword)
  Future<ResetPasswordResponse> resetPassword(
    @Field(RequestsConstants.email) email,
    @Field(RequestsConstants.password) password,
    @Field(RequestsConstants.otp) otp,
  );

  @POST(RequestsConstants.categoryDetails)
  Future<CategoryDetailsResponse> categoryDetails(
    @Field(RequestsConstants.categoryId) categoryId,
  );

  @POST(RequestsConstants.fcmTokenUpdate)
  Future<FcmTokenResponse> fcmTokenUpdate(
    @Field(RequestsConstants.fcmToken) fcmToken,
  );

  @GET(RequestsConstants.paymentMethods)
  Future<PaymentsResponse> paymentMethods();

  @GET(RequestsConstants.notificationsRequest)
  Future<NotificationsResponse> notifications();

  @GET(RequestsConstants.balanceRequest)
  Future<BalanceResponse> balance();

  @POST(RequestsConstants.cancelReservation)
  Future<CancelReservationResponse> cancelReservation(
      @Field(RequestsConstants.reservationId) reservationId);

  @POST(RequestsConstants.resourceDetails)
  Future<ResourceDetailsResponse> resourceDetails(
      @Field(RequestsConstants.resourceId) resourceId);

  @GET(RequestsConstants.subscriptions)
  Future<SubscriptionsResponse> subscriptions();

  @GET(RequestsConstants.resources)
  Future<ResourcesResponse> resources();
}
