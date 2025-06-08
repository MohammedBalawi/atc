import 'package:act_hub_mobile/features/profile/data/response/balance_response.dart';
import '../../../../core/network/app_api.dart';

abstract class BalanceRemoteDataSource {
  Future<BalanceResponse> balance();
}

class BalanceRemoteDataSourceImplement implements BalanceRemoteDataSource {
  AppService _appService;

  BalanceRemoteDataSourceImplement(this._appService);

  @override
  Future<BalanceResponse> balance() async {
    return await _appService.balance();
  }
}
