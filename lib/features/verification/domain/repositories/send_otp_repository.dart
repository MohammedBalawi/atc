import 'package:act_hub_mobile/features/verification/data/request/send_otp_request.dart';
import 'package:act_hub_mobile/features/verification/domain/models/send_otp_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
abstract class SendOtpRepository{
  Future<Either<Failure,SendOtpModel>> sendOtp(SendOtpRequest sendOtpRequest);
}