import 'package:act_hub_mobile/core/error_handler/error_handler.dart';
import 'package:act_hub_mobile/core/usecase/base_usecase.dart';
import 'package:act_hub_mobile/features/appointment/domain/model/reservations_model.dart';
import 'package:act_hub_mobile/features/appointment/domain/repository/reservations_repository.dart';
import 'package:dartz/dartz.dart';

class ReservationsUseCase implements BaseGetUseCase {
  final ReservationsRepository _reservationsRepository;

  ReservationsUseCase(this._reservationsRepository);

  @override
  Future<Either<Failure, ReservationsModel>> execute() async {
    return await _reservationsRepository.reservations();
  }
}