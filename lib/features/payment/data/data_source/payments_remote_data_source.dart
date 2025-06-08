import '../../../../core/network/app_api.dart';
import '../response/payments_response.dart';

abstract class RemotePaymentsDataSource {
  Future<PaymentsResponse> categories();
}

class RemotePaymentsDataSourceImplement implements RemotePaymentsDataSource {
  AppService _appService;

  RemotePaymentsDataSourceImplement(this._appService);

  @override
  Future<PaymentsResponse> categories() async {
    return await _appService.paymentMethods();
  }
}
