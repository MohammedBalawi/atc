import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/auth/data/response/fcm_token_response.dart';
import 'package:act_hub_mobile/features/auth/domain/models/fcm_token_model.dart';

extension FcmTokenMapper on FcmTokenResponse {
  FcmTokenModel toDomain() {
    return FcmTokenModel(
      status: status.onNull(), message: message.onNull(),
    );
  }
}
