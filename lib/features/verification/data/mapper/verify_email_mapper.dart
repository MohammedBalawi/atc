

import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/verification/data/response/verify_email_response.dart';
import 'package:act_hub_mobile/features/verification/domain/models/verify_email_model.dart';

extension VerifyEmailMapper on VerifyEmailResponse{
  toDomain() => VerifyEmail(status: this.status?.onNull());
}