import 'package:act_hub_mobile/core/error_handler/error_handler.dart';
import 'package:act_hub_mobile/core/usecase/base_usecase.dart';
import 'package:act_hub_mobile/features/home/domain/model/home_model.dart';
import 'package:act_hub_mobile/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeUseCase implements BaseGetUseCase {
  final HomeRepository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeModel>> execute() async {
    return await _repository.home();
  }
}
