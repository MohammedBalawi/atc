import 'package:act_hub_mobile/features/category/data/request/category_details_request.dart';
import 'package:act_hub_mobile/features/category/domain/model/category_details_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';

abstract class CategoryDetailsRepository{
  Future<Either<Failure,CategoryDetailsModel>> categoryDetails(CategoryDetailsRequest request);
}