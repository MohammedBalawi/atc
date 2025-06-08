import 'package:act_hub_mobile/core/extensions/extensions.dart';
import '../../domain/model/resource_attributes_model.dart';
import '../response/resource_attributes_response.dart';

extension ResourceAttributesMapper on ResourceAttributesResponse {
  ResourceAttributesModel toDomain() {
    return ResourceAttributesModel(
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
