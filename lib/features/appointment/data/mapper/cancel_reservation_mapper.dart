import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/appointment/data/response/cancel_reservation_response.dart';
import 'package:act_hub_mobile/features/appointment/domain/model/cancel_reservation_model.dart';

extension CancelReservationMapper on CancelReservationResponse {
  CancelReservationModel toDomain() =>
      CancelReservationModel(status: this.status.onNull());
}
