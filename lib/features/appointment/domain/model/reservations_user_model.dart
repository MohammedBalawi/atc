import 'package:act_hub_mobile/features/appointment/domain/model/reservations_user_attribute_model.dart';

class ReservationsUserModel {
  int? id;
  String? status;
  ReservationsUserAttributeModel? reservationsUserAttributeModel;

  ReservationsUserModel({
    this.id,
    this.status,
    this.reservationsUserAttributeModel,
  });
}
