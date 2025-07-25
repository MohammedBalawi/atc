import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/core/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse  extends BaseResponse{
  @JsonKey(name: ResponseConstants.status)
  bool? status;

  RegisterResponse({required this.status});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}
