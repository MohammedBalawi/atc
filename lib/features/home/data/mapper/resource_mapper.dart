import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/home/data/mapper/resource_attributes_mapper.dart';
import '../../domain/model/resource_model.dart';
import '../response/resource_response.dart';

extension ResourceMapper on ResourceResponse {
  ResourceModel toDomain() {
    return ResourceModel(
      id: this.id.onNull(),
      attributes: this.resourceAttributesResponse!.toDomain(),
    );
  }
}
