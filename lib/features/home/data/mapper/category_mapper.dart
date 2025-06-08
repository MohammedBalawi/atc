import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/home/data/mapper/category_attribute_mapper.dart';
import 'package:act_hub_mobile/features/home/domain/model/category_model.dart';
import '../response/category_response.dart';

extension CategoryMapper on CategoryResponse {
  CategoryModel toDomain() {
    return CategoryModel(
      id: this.id.onNull(),
      type: this.type.onNull(),
      categoryAttributeModel: this.categoryAttributeResponse?.toDomain(),
    );
  }
}
