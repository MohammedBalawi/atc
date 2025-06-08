import 'package:act_hub_mobile/features/category/data/mapper/category_mapper.dart';
import 'package:act_hub_mobile/features/category/data/response/categories_response.dart';
import 'package:act_hub_mobile/features/category/domain/model/categories_model.dart';
import '../response/category_response.dart';

extension CategoriesMapper on CategoriesResponse {
  CategoriesModel toDomain() {
    return CategoriesModel(
        data: this
            .data
            ?.map((CategoryResponse category) => category.toDomain())
            .toList());
  }
}
