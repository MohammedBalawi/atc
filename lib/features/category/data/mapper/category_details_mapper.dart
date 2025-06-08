import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/category/data/mapper/category_details_data_mapper.dart';
import 'package:act_hub_mobile/features/category/data/response/category_details_response.dart';
import 'package:act_hub_mobile/features/category/domain/model/category_details_model.dart';

extension CategoryDetailsMapper on CategoryDetailsResponse {
  CategoryDetailsModel toDomain() {
    return CategoryDetailsModel(
      data: this.data?.toDomain(),
      message: this.message.onNull(),
    );
  }
}
