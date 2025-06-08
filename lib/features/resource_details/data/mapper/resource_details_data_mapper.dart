import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/resource_details/data/mapper/resource_details_attributes_mapper.dart';
import 'package:act_hub_mobile/features/resource_details/data/mapper/resource_reservations_mapper.dart';
import 'package:act_hub_mobile/features/resource_details/data/response/resource_details_data_response.dart';
import 'package:act_hub_mobile/features/resource_details/domain/models/resource_details_data_model.dart';
extension ResourceDetailsDataMapper on ResourceDetailsDataResponse {
  ResourceDetailsDataModel toDomain() {
    return ResourceDetailsDataModel(
      id: id.onNull(),
      attributes: attributes!.toDomain(),
      reservations: reservations!.map((e) => e.toDomain()).toList(),
    );
  }
}
