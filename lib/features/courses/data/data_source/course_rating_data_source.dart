import 'package:act_hub_mobile/features/courses/data/request/course_rating_request.dart';
import 'package:act_hub_mobile/features/courses/data/response/course_rating_response.dart';
import '../../../../core/network/app_api.dart';

abstract class RemoteCourseRatingDataSource{
  Future<CourseRatingResponse> courseRating(CourseRatingRequest courseRatingRequest);
}

class RemoteCourseRatingDataSourceImplement implements RemoteCourseRatingDataSource {
  AppService _appService;

  RemoteCourseRatingDataSourceImplement(this._appService);

  @override
  Future<CourseRatingResponse> courseRating(CourseRatingRequest courseRatingRequest) async{
    return await _appService.courseRating(courseRatingRequest.courseId, courseRatingRequest.value);
  }
}