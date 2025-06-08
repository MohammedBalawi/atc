

import 'package:act_hub_mobile/features/appointment/data/request/book_appointment_request.dart';
import 'package:act_hub_mobile/features/appointment/domain/model/book_appointment_model.dart';
import 'package:act_hub_mobile/features/appointment/domain/repository/book_appointment_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/usecase/base_usecase.dart';

class BookAppointmentUseCase implements BaseUseCase<BookAppointmentRequest, BookAppointmentModel> {
  final BookAppointmentRepository _repository;
  BookAppointmentUseCase(this._repository);
  @override
  Future<Either<Failure, BookAppointmentModel>> execute(BookAppointmentRequest input) async {
    return await _repository.bookAppointment(input);
  }
}