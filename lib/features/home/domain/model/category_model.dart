import 'category_attributes_model.dart';

class CategoryModel {
  int? id;
  String? type;
  CategoryAttributeModel? categoryAttributeModel;

  CategoryModel({
    this.id,
    this.type,
    this.categoryAttributeModel,
  });
}
