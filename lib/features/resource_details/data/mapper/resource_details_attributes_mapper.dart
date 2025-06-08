import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/resource_details/data/response/resource_details_attributes_response.dart';
import 'package:act_hub_mobile/features/resource_details/domain/models/resource_details_attributes_model.dart';

extension ResourceDetailsAttributesMapper on ResourceDetailsAttributesResponse {
  ResourceDetailsAttributesModel toDomain() {
    return ResourceDetailsAttributesModel(
      name: name.onNull(),
      numberSeats: numberSeats.onNull(),
      thumbnailImage: thumbnailImage.onNull(),
      priceByHour: priceByHour.onNull(),
      priceByDay: priceByDay.onNull(),
      priceByWeek: priceByWeek.onNull(),
      priceByMonth: priceByMonth.onNull(),
      description: description.onNull()
    );
  }
}
