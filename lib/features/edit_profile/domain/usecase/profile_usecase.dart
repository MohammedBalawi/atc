import 'package:act_hub_mobile/core/usecase/base_usecase.dart';
import 'package:act_hub_mobile/features/edit_profile/domain/models/profile_model.dart';
import 'package:act_hub_mobile/features/edit_profile/domain/repository/profile_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';

class ProfileUseCase implements BaseGetUseCase<ProfileModel> {
  final ProfileRepository _repository;

  ProfileUseCase(this._repository);

  @override
  Future<Either<Failure, ProfileModel>> execute() async {
    return await _repository.profile();
  }
}
