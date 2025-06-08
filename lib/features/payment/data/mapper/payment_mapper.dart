import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/payment/data/response/payment_response.dart';
import 'package:act_hub_mobile/features/payment/domain/model/payment_model.dart';

extension PaymentMapper on PaymentResponse {
  PaymentModel toDomain() {
    return PaymentModel(
      id: this.id.onNull(),
      name: this.name.onNull(),
    );
  }
}
