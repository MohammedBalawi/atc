// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:act_hub_mobile/core/error_handler/error_handler.dart';
import 'package:act_hub_mobile/core/usecase/base_usecase.dart';
import 'package:act_hub_mobile/features/auth/data/request/register_request.dart';
import 'package:act_hub_mobile/features/auth/domain/models/register_model.dart';
import 'package:act_hub_mobile/features/auth/domain/repository/register_repository.dart';

class RegisterUseCase implements BaseUseCase<RegisterUseCaseInput, Register> {
  final RegisterRepository _repository;
  RegisterUseCase(this._repository);
  @override
  Future<Either<Failure, Register>> execute(RegisterUseCaseInput input) async {
    return await _repository.register(RegisterRequest(
        fullName: input.fullName,
        email: input.email,
        phone: input.phone,
        password: input.password,
        confirmPassword: input.confirmPassword));
  }
}

class RegisterUseCaseInput {
  String fullName;
  String email;
  String phone;
  String password;
  String confirmPassword;
  RegisterUseCaseInput({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });
}
