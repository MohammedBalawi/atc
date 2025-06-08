import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/verification/data/response/send_otp_response.dart';
import 'package:act_hub_mobile/features/verification/domain/models/send_otp_model.dart';

extension SendOtpMapper on SendOtpResponse {
  toDomain() => SendOtpModel(status: this.status?.onNull());
}
