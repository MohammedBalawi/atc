import 'package:act_hub_mobile/features/category/data/request/category_details_request.dart';
import 'package:act_hub_mobile/features/category/data/response/category_details_response.dart';
import '../../../../core/network/app_api.dart';

abstract class RemoteCategoryDetailsDataSource {
  Future<CategoryDetailsResponse> categoryDetails(
    CategoryDetailsRequest request,
  );
}

class RemoteCategoryDetailsDateSourceImplement
    implements RemoteCategoryDetailsDataSource {
  AppService _appService;

  RemoteCategoryDetailsDateSourceImplement(this._appService);

  @override
  Future<CategoryDetailsResponse> categoryDetails(
      CategoryDetailsRequest request) async {
    return await _appService.categoryDetails(
      request.categoryId,
    );
  }
}
