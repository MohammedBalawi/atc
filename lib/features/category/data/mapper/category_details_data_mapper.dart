import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/category/data/mapper/category_details_attributes_mapper.dart';
import 'package:act_hub_mobile/features/category/data/response/category_details_data_response.dart';
import 'package:act_hub_mobile/features/category/domain/model/category_details_data_model.dart';

extension CategoryDetailsDataMapper on CategoryDetailsDataResponse {
  CategoryDetailsDataModel toDomain() {
    return CategoryDetailsDataModel(
      id: this.id.onNull(),
      attributes: this.attributes?.toDomain(),
    );
  }
}
