import 'package:act_hub_mobile/core/network/app_api.dart';
import 'package:act_hub_mobile/features/courses/data/request/course_description_requset.dart';
import '../response/course_description_data_response.dart';

abstract class RemoteCourseDescriptionDataSource {
  Future<CourseDescriptionDataResponse> courseDescription(
      CourseDescriptionRequest courseDescriptionRequest);
}

class RemoteCourseDescriptionDataSourceImplement
    implements RemoteCourseDescriptionDataSource {
  AppService _appService;

  RemoteCourseDescriptionDataSourceImplement(this._appService);

  @override
  Future<CourseDescriptionDataResponse> courseDescription(
      CourseDescriptionRequest courseDescriptionRequest) async {
    return await _appService
        .courseDescription(courseDescriptionRequest.courseId);
  }
}
