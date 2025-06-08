// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:act_hub_mobile/core/base_model/base_model.dart';
import 'package:act_hub_mobile/features/appointment/domain/model/reservations_user_model.dart';

class ReservationsModel extends BaseModel {
  List<ReservationsUserModel>? reservations_user_model;
  
  ReservationsModel({
    this.reservations_user_model,
    super.message,
  });
}
