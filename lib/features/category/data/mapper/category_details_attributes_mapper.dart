import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/category/data/mapper/category_details_resource_mapper.dart';
import 'package:act_hub_mobile/features/category/data/response/category_details_attributes_response.dart';
import 'package:act_hub_mobile/features/category/data/response/category_details_resource_response.dart';
import 'package:act_hub_mobile/features/category/domain/model/category_details_attributes_model.dart';

extension CategoryDetailsAttributesMapper on CategoryDetailsAttributesResponse {
  CategoryDetailsAttributesModel toDomain() {
    return CategoryDetailsAttributesModel(
      name: this.name.onNull(),
      description: this.description.onNull(),
      icon: this.icon.onNull(),
      banner: this.banner.onNull(),
      resources: this
          .resources
          ?.map(
            (CategoryDetailsResourceResponse categoryDetailsResourceResponse) =>
                categoryDetailsResourceResponse.toDomain(),
          )
          .toList(),
    );
  }
}
