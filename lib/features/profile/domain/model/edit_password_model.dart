import 'package:act_hub_mobile/core/base_model/base_model.dart';

import 'edit_password_data_model.dart';

class EditPasswordModel extends BaseModel {
  EditPasswordDataModel? data;
  bool? status;

  EditPasswordModel(
      {required this.status, required this.data, required super.message});
}
