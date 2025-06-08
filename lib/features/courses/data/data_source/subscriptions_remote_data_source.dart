import 'package:act_hub_mobile/core/network/app_api.dart';

import '../response/subscriptions_response.dart';

abstract class SubscriptionsRemoteDataSource {
  Future<SubscriptionsResponse> subscriptions();
}

class SubscriptionsRemoteDataSourceImplementation extends SubscriptionsRemoteDataSource {
  AppService _appService;

  SubscriptionsRemoteDataSourceImplementation(this._appService);

  @override
  Future<SubscriptionsResponse> subscriptions() async {
    return await _appService.subscriptions();
  }

}
