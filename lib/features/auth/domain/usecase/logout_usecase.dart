import 'package:act_hub_mobile/core/error_handler/error_handler.dart';
import 'package:act_hub_mobile/core/usecase/base_usecase.dart';
import 'package:act_hub_mobile/features/auth/domain/models/logout_model.dart';
import 'package:act_hub_mobile/features/auth/domain/repository/logout_repository.dart';
import 'package:dartz/dartz.dart';

class LogoutUseCase implements BaseGetUseCase<Logout> {
  final LogoutRepository _repository;

  LogoutUseCase(this._repository);

  @override
  Future<Either<Failure, Logout>> execute() async {
    return await _repository.logout();
  }
}
