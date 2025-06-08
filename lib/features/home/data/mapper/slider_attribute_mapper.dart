import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/home/data/response/slider_attributes_response.dart';
import 'package:act_hub_mobile/features/home/domain/model/slider_attributes_model.dart';

extension SliderAttributeMapper on SliderAttributeResponse {
  SliderAttributeModel toDomain() {
    return SliderAttributeModel(
      title: this.title.onNull(),
      sub_title: this.sub_title.onNull(),
      description: this.description.onNull(),
      image_url: this.image_url.onNull(),
      rate: this.rate.onNull(),
    );
  }
}
