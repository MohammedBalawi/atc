import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/profile/data/response/balance_response.dart';
import 'package:act_hub_mobile/features/profile/domain/model/balance_model.dart';

extension BalanceMapper on BalanceResponse {
  BalanceModel toDomain() => BalanceModel(balance: this.balance.onNull());
}
