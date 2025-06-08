import 'package:act_hub_mobile/features/auth/domain/models/logout_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';

abstract class LogoutRepository{
  Future<Either<Failure,Logout>> logout();
}