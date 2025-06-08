import 'package:act_hub_mobile/features/category/data/response/categories_response.dart';
import '../../../../core/network/app_api.dart';

abstract class RemoteCategoriesDataSource {
  Future<CategoriesResponse> categories();
}

class RemoteCategoriesDataSourceImplement
    implements RemoteCategoriesDataSource {
  AppService _appService;

  RemoteCategoriesDataSourceImplement(this._appService);

  @override
  Future<CategoriesResponse> categories() async {
    return await _appService.categories();
  }
}
