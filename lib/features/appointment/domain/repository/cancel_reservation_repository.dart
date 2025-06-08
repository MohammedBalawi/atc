import 'package:act_hub_mobile/features/appointment/data/request/cancel_reservation_request.dart';
import 'package:act_hub_mobile/features/appointment/domain/model/cancel_reservation_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';

abstract class CancelReservationRepository{
  Future<Either<Failure, CancelReservationModel>> cancelReservation(
      CancelReservationRequest cancelReservationRequest);
}
