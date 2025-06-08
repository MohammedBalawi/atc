import 'package:act_hub_mobile/features/category/domain/model/categories_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';

abstract class CategoriesRepository{
  Future<Either<Failure,CategoriesModel>> categories();
}
