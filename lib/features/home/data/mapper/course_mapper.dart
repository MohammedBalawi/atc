import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/home/data/mapper/course_attribute_mapper.dart';
import 'package:act_hub_mobile/features/home/data/response/course_response.dart';
import 'package:act_hub_mobile/features/home/domain/model/course_model.dart';

extension CourseMapper on CourseResponse {
  CourseModel toDomain() {
    return CourseModel(
      id: this.id.onNull(),
      courseAttributeModel: this.courseAttributeResponse!.toDomain(),
    );
  }
}
