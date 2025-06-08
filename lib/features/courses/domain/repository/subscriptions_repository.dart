import 'package:act_hub_mobile/core/error_handler/error_handler.dart';
import 'package:dartz/dartz.dart';
import '../models/subscriptions_model.dart';

abstract class SubscriptionsRepository {
  Future<Either<Failure, SubscriptionsModel>> subscriptions();
}
