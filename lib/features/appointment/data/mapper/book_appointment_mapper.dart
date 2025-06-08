import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/appointment/data/response/book_appointment_response.dart';
import 'package:act_hub_mobile/features/appointment/domain/model/book_appointment_model.dart';

extension BookApointmentMapper on BookAppointmentResponse {
  BookAppointmentModel toDomain() =>
      BookAppointmentModel(status: this.status.onNull(), message: this.message.onNull());
}
