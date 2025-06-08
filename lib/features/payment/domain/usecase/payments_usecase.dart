import 'package:act_hub_mobile/core/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../model/payments_model.dart';
import '../repository/payments_repository.dart';

class PaymentsUseCase implements BaseGetUseCase<PaymentsModel> {
  final PaymentsRepository _repository;

  PaymentsUseCase(this._repository);

  @override
  Future<Either<Failure, PaymentsModel>> execute() async {
    return await _repository.payments();
  }
}
