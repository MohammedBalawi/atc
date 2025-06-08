import 'package:act_hub_mobile/core/network/app_api.dart';
import 'package:act_hub_mobile/features/appointment/data/response/reservations_response.dart';

abstract class RemoteReservationsDataSource {
  Future<ReservationsResponse> getReservationsData();
}

class RemoteReservationsDataSourceImplement
    implements RemoteReservationsDataSource {
  AppService _appService;

  RemoteReservationsDataSourceImplement(this._appService);

  @override
  Future<ReservationsResponse> getReservationsData() async {
    return await _appService.reservations();
  }
}
