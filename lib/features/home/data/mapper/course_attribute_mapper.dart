import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/home/data/response/course_attributes_response.dart';
import 'package:act_hub_mobile/features/home/domain/model/course_attributes_model.dart';

extension CourseAttributeMapper on CourseAttributeResponse {
  CourseAttributeModel toDomain() {
    return CourseAttributeModel(
      name: this.name.onNull(),
      description: this.description.onNull(),
      resourceId: this.resourceId.onNull(),
      hours: this.hours.onNull(),
      price: this.price.onNull(),
      rate: this.rate.onNull(),
      start_date: this.start_date.onNull(),
      end_date: this.end_date.onNull(),
      avatar: this.avatar.onNull(),
    );
  }
}
