import 'package:act_hub_mobile/features/resource_details/data/response/resource_details_response.dart';
import '../../../../core/network/app_api.dart';
import '../request/resource_details_request.dart';

abstract class RemoteResourceDetailsDataSource {
  Future<ResourceDetailsResponse> resourceDetails(
    ResourceDetailsRequest request,
  );
}

class RemoteResourceDetailsDateSourceImplement
    implements RemoteResourceDetailsDataSource {
  AppService _appService;

  RemoteResourceDetailsDateSourceImplement(this._appService);

  @override
  Future<ResourceDetailsResponse> resourceDetails(
    ResourceDetailsRequest request,
  ) async {
    return await _appService.resourceDetails(request.resourceId);
  }
}
