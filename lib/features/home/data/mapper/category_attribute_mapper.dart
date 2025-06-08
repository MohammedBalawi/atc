import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/home/data/response/category_attributes_response.dart';
import 'package:act_hub_mobile/features/home/domain/model/category_attributes_model.dart';

extension CategoryAttributeMapper on CategoryAttributeResponse {
  CategoryAttributeModel toDomain() {
    return CategoryAttributeModel(
      name: this.name.onNull(),
      description: this.description.onNull(),
      icon: this.icon.onNull(),
      banner: this.banner.onNull(),
    );
  }
}
