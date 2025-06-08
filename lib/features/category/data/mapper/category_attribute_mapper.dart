import 'package:act_hub_mobile/core/extensions/extensions.dart';
import '../../domain/model/category_attributes_model.dart';
import '../response/category_attributes_response.dart';


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
