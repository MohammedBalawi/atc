import 'package:act_hub_mobile/features/appointment/data/request/cancel_reservation_request.dart';
import 'package:act_hub_mobile/features/appointment/domain/model/cancel_reservation_model.dart';
import 'package:act_hub_mobile/features/appointment/domain/repository/cancel_reservation_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/usecase/base_usecase.dart';

class CancelReservationUseCase implements BaseUseCase<CancelReservationRequest, CancelReservationModel> {
  final CancelReservationRepository _repository;
  CancelReservationUseCase(this._repository);
  @override
  Future<Either<Failure, CancelReservationModel>> execute(CancelReservationRequest input) async {
    return await _repository.cancelReservation(input);
  }
}