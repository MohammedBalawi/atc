import 'package:act_hub_mobile/core/base_model/base_model.dart';
import 'package:act_hub_mobile/features/edit_profile/domain/models/profile_attributes_model.dart';

class ProfileModel extends BaseModel {
  ProfileModelData data;

  ProfileModel({required this.data, required super.message});
}

class ProfileModelData {
  String type;
  int id;
  ProfileAttributesModel attributes;

  ProfileModelData(
      {required this.type,
      required this.id,
      required this.attributes,});
}
