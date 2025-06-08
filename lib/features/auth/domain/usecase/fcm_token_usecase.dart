import 'package:act_hub_mobile/core/error_handler/error_handler.dart';
import 'package:act_hub_mobile/core/usecase/base_usecase.dart';
import 'package:act_hub_mobile/features/auth/data/request/fvm_token_request.dart';
import 'package:act_hub_mobile/features/auth/domain/models/fcm_token_model.dart';
import 'package:act_hub_mobile/features/auth/domain/repository/fcm_token_repository.dart';
import 'package:dartz/dartz.dart';

class FcmTokenUseCase implements BaseUseCase<FcmTokenRequest, FcmTokenModel> {
  FcmTokenRepository _fcmTokenRepository;

  FcmTokenUseCase(this._fcmTokenRepository);

  @override
  Future<Either<Failure, FcmTokenModel>> execute(FcmTokenRequest input) async {
    return await _fcmTokenRepository.fcmToken(
      FcmTokenRequest(
        fcmToken: input.fcmToken,
      ),
    );
  }
}
