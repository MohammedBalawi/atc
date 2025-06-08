import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/edit_profile/data/mapper/profile_attributes_mapper.dart';
import 'package:act_hub_mobile/features/edit_profile/data/response/profile_response.dart';
import 'package:act_hub_mobile/features/edit_profile/domain/models/profile_model.dart';

extension ProfileMapper on ProfileResponse {
  toDomain() =>
      ProfileModel(data: this.data?.toDomain(), message: this.message.onNull());
}

extension ProfileDataMapper on ProfileResponseData {
  toDomain() => ProfileModelData(
        id: this.id.onNull(),
        type: this.type.onNull(),
        attributes: this.attributes!.toDomain(),
      );
}
