import 'package:act_hub_mobile/features/appointment/data/request/book_appointment_request.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../model/book_appointment_model.dart';

abstract class BookAppointmentRepository {
  Future<Either<Failure, BookAppointmentModel>> bookAppointment(
      BookAppointmentRequest bookAppointmentRequest);
}
