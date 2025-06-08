

import 'package:act_hub_mobile/features/courses/data/response/courses_response.dart';
import '../../../../core/network/app_api.dart';

abstract class RemoteCoursesDataSource{
  Future<CoursesResponse> courses();
}

class RemoteCoursesDataSourceImplement implements RemoteCoursesDataSource {
  AppService _appService;

  RemoteCoursesDataSourceImplement(this._appService);

  @override
  Future<CoursesResponse> courses() async{
    return await _appService.courses();
  }
}
