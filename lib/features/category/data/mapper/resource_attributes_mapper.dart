import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/category/data/response/resource_attributes_response.dart';
import 'package:act_hub_mobile/features/category/domain/model/resource_attributes_model.dart';

extension ResourceAttributesMapper on ResourceAttributesResponse {
  ResourceAttributesModel toDomain() {
    return ResourceAttributesModel(
      name: this.name.onNull(),
      numberSeats: this.numberSeats.onNull(),
      thumbnailImage: this.thumbnailImage.onNull(),
      priceByHour: this.priceByHour.onNull(),
      priceByDay: this.priceByDay.onNull(),
      priceByWeak: this.priceByWeak.onNull(),
      priceByMonth: this.priceByMonth.onNull(),
    );
  }
}
