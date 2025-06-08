import 'package:act_hub_mobile/features/home/data/mapper/slider_attribute_mapper.dart';
import 'package:act_hub_mobile/features/home/data/response/slider_response.dart';
import '../../domain/model/slider_model.dart';

extension SliderMapper on SliderResponse {
  SliderModel toDomain() {
    return SliderModel(
        id: this.id,
        type: this.type,
        sliderAttributeModel: this.sliderAttributeResponse?.toDomain());
  }
}
