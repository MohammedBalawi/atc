import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/courses/data/response/course_description_attributes_response.dart';
import 'package:act_hub_mobile/features/courses/domain/models/course_description_attributes_model.dart';

extension CourseDescriptionAttributeMapper
    on CourseDescriptionAttributesResponse {
  CourseDescriptionAttributesModel toDomain() {
    return CourseDescriptionAttributesModel(
      name: this.name.onNull(),
      description: this.description.onNull(),
      resource_id: this.resourceId.onNull(),
      active: this.active.onNull(),
      hours: this.hours.onNull(),
      price: this.price.onNull(),
      rate: this.rate.onNull(),
      start_date: this.start_date.onNull(),
      end_date: this.end_date.onNull(),
      avatar: this.avatar.onNull(),
    );
  }
}
