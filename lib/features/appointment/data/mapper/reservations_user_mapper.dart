import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/appointment/data/mapper/reservations_user_attribute_mapper.dart';
import 'package:act_hub_mobile/features/appointment/data/response/reservations_user_response.dart';
import 'package:act_hub_mobile/features/appointment/domain/model/reservations_user_model.dart';

extension ReservationsUserMapper on ReservationsUserResponse {
  ReservationsUserModel toDomain() {
    return ReservationsUserModel(
      id: this.id.onNull(),
      status: this.status.onNull(),
      reservationsUserAttributeModel:
          reservationsUserAttributesResponse?.toDomain(),
    );
  }
}
