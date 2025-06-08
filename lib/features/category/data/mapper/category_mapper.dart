import 'package:act_hub_mobile/core/extensions/extensions.dart';
import '../../domain/model/category_model.dart';
import '../response/category_response.dart';
import '../mapper/category_attribute_mapper.dart';

extension CategoryMapper on CategoryResponse {
  CategoryModel toDomain() {
    return CategoryModel(
        id: this.id.onNull(),
        categoryAttributeModel: this.categoryAttributeResponse?.toDomain());
  }
}
