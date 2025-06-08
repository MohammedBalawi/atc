import 'package:act_hub_mobile/features/appointment/data/request/book_appointment_request.dart';

import '../../../../core/network/app_api.dart';
import '../response/book_appointment_response.dart';

abstract class RemoteBookAppointmentDataSource {
  Future<BookAppointmentResponse> bookAppointment(
      BookAppointmentRequest bookAppointmentRequest);
}

class RemoteBookAppointmentDateSourceImplement
    implements RemoteBookAppointmentDataSource {
  AppService _appService;

  RemoteBookAppointmentDateSourceImplement(this._appService);

  @override
  Future<BookAppointmentResponse> bookAppointment(
      BookAppointmentRequest bookAppointmentRequest) async {
    return await _appService.bookAppointment(
      bookAppointmentRequest.pricingOption.toString(),
      bookAppointmentRequest.pricingInput,
      bookAppointmentRequest.resourceId,
      bookAppointmentRequest.startDate,
      bookAppointmentRequest.paymentMethodId,
    );
  }
}
