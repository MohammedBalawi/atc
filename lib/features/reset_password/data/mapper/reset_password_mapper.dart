import 'package:act_hub_mobile/core/extensions/extensions.dart';
import '../../domain/models/reset_password.dart';
import '../response/reset_password_response.dart';

extension ResetPasswordMapper on ResetPasswordResponse {
  ResetPassword toDomain() {
    return ResetPassword(
      status: status.onNull(),
    );
  }
}
