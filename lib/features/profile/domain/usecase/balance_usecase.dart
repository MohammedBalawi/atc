import 'package:act_hub_mobile/features/profile/domain/model/balance_model.dart';
import 'package:act_hub_mobile/features/profile/domain/repository/balance_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/usecase/base_usecase.dart';

class BalanceUseCase implements BaseGetUseCase {
  final BalanceRepository _repository;

  BalanceUseCase(this._repository);

  @override
  Future<Either<Failure, BalanceModel>> execute() async {
    return await _repository.balance();
  }
}
