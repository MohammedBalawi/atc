import 'package:act_hub_mobile/core/error_handler/error_handler.dart';
import 'package:act_hub_mobile/core/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../models/subscriptions_model.dart';
import '../repository/subscriptions_repository.dart';

class SubscriptionsUseCase implements BaseGetUseCase {
  final SubscriptionsRepository _subscriptionsRepository;

  SubscriptionsUseCase(this._subscriptionsRepository);

  @override
  Future<Either<Failure, SubscriptionsModel>> execute() async {
    return await _subscriptionsRepository.subscriptions();
  }
}