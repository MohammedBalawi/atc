import 'package:act_hub_mobile/features/payment/domain/model/payments_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';

abstract class PaymentsRepository{
  Future<Either<Failure,PaymentsModel>> payments();
}
