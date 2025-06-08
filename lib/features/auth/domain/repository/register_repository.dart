import 'package:act_hub_mobile/core/error_handler/error_handler.dart';
import 'package:act_hub_mobile/features/auth/data/request/register_request.dart';
import 'package:act_hub_mobile/features/auth/domain/models/register_model.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepository{
  Future<Either<Failure,Register>> register(RegisterRequest registerRequest);
}