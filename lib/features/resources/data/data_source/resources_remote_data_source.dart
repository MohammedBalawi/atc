import '../../../../core/network/app_api.dart';
import '../response/resources_response.dart';

abstract class RemoteResourcesDataSource {
  Future<ResourcesResponse> resources();
}

class RemoteResourcesDateSourceImplement implements RemoteResourcesDataSource {
  AppService _appService;

  RemoteResourcesDateSourceImplement(this._appService);

  @override
  Future<ResourcesResponse> resources() async {
    return await _appService.resources();
  }
}
