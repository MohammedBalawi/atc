import 'package:act_hub_mobile/features/payment/data/mapper/payment_mapper.dart';
import 'package:act_hub_mobile/features/payment/domain/model/payments_model.dart';
import '../response/payment_response.dart';
import '../response/payments_response.dart';

extension PaymentsMapper on PaymentsResponse {
  PaymentsModel toDomain() {
    return PaymentsModel(
      data: this
          .data
          ?.map(
            (PaymentResponse paymentResponse) => paymentResponse.toDomain(),
          )
          .toList(),
    );
  }
}
