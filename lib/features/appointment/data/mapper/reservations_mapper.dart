import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/appointment/data/mapper/reservations_user_mapper.dart';
import 'package:act_hub_mobile/features/appointment/data/response/reservations_response.dart';
import 'package:act_hub_mobile/features/appointment/data/response/reservations_user_response.dart';
import 'package:act_hub_mobile/features/appointment/domain/model/reservations_model.dart';

extension ReservationsMapper on ReservationsResponse {
  ReservationsModel toDomain() {
    return ReservationsModel(
        message: this.message.onNull(),
        reservations_user_model: this
            .reservationsUserResponse
            ?.map((ReservationsUserResponse reservationsUserResponse) =>
                reservationsUserResponse.toDomain())
            .toList());
  }
}
