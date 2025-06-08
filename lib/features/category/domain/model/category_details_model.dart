import 'package:act_hub_mobile/core/base_model/base_model.dart';
import 'package:act_hub_mobile/features/category/domain/model/category_details_data_model.dart';

class CategoryDetailsModel extends BaseModel {
  CategoryDetailsDataModel? data;

  CategoryDetailsModel({this.data, super.message});
}
