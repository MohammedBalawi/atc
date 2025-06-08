import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/edit_profile/domain/models/user_attributes_model.dart';

import '../response/user_attributes_response.dart';

extension UserAttributesMapper on UserAttributesResponse {
  UserAttributesModel toDomain() {
    return UserAttributesModel(
      name: this.name.onNull(),
      phone: this.phone.onNull(),
      email: this.email.onNull(),
    );
  }
}

extension AttributesUserMapper on AttributesUserResponse {
  AttributesUserModel toDomain() {
    return AttributesUserModel(attributes: this.attributes?.toDomain());
  }
}

