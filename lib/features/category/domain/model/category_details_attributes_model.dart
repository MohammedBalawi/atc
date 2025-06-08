import 'package:act_hub_mobile/features/category/domain/model/category_details_resource_model.dart';

class CategoryDetailsAttributesModel {
  String? name;
  String? description;
  String? icon;
  String? banner;
  List<CategoryDetailsResourceModel>? resources;

  CategoryDetailsAttributesModel({
    required this.name,
    required this.description,
    required this.icon,
    required this.banner,
    required this.resources,
  });
}
