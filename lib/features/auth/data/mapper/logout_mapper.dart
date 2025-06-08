
import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/auth/data/response/logout_response.dart';
import 'package:act_hub_mobile/features/auth/domain/models/logout_model.dart';

extension LogoutMapper on LogoutResponse{
  toDomain() =>
      Logout(status: this.status.onNull());
}