import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/auth/data/response/register_response.dart';
import 'package:act_hub_mobile/features/auth/domain/models/register_model.dart';

extension RegisterMapper on RegisterResponse{
  toDomain() =>
      Register(status: this.status.onNull());
}