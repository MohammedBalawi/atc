import 'package:act_hub_mobile/features/appointment/data/request/cancel_reservation_request.dart';
import 'package:act_hub_mobile/features/appointment/data/response/cancel_reservation_response.dart';
import '../../../../core/network/app_api.dart';

abstract class CancelReservationRemoteDataSource {
  Future<CancelReservationResponse> cancelReservation(
      CancelReservationRequest cancelReservationRequest);
}

class CancelReservationRemoteDataSourceImplement
    implements CancelReservationRemoteDataSource {
  AppService _appService;

  CancelReservationRemoteDataSourceImplement(this._appService);

  @override
  Future<CancelReservationResponse> cancelReservation(
      CancelReservationRequest cancelReservationRequest) async {
    return await _appService
        .cancelReservation(cancelReservationRequest.reservationId);
  }
}
