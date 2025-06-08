import 'package:act_hub_mobile/core/error_handler/error_handler.dart';
import 'package:act_hub_mobile/features/appointment/domain/model/reservations_model.dart';
import 'package:dartz/dartz.dart';

abstract class ReservationsRepository {
  Future<Either<Failure, ReservationsModel>> reservations();
}
