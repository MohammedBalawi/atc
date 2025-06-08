import 'package:act_hub_mobile/features/courses/data/mapper/course_description_mapper.dart';
import 'package:act_hub_mobile/features/courses/data/response/course_description_data_response.dart';
import 'package:act_hub_mobile/features/courses/domain/models/course_description_data_model.dart';

extension CourseDescriptionDataMapper on CourseDescriptionDataResponse{
  CourseDescriptionDataModel toDomain() => CourseDescriptionDataModel(data: this.data!.toDomain());
}