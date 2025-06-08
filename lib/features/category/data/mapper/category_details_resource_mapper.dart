import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/category/data/mapper/resource_attributes_mapper.dart';
import 'package:act_hub_mobile/features/category/data/response/category_details_resource_response.dart';
import 'package:act_hub_mobile/features/category/domain/model/category_details_resource_model.dart';

extension CategoryDetailsResourceMapper on CategoryDetailsResourceResponse {
  CategoryDetailsResourceModel toDomain() {
    return CategoryDetailsResourceModel(
      id: this.id.onNull(),
      attributes: this.attributes?.toDomain(),
    );
  }
}
