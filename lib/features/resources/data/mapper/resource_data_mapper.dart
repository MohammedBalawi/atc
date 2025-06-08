import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/resources/data/mapper/resource_attributes_mapper.dart';
import 'package:act_hub_mobile/features/resources/data/mapper/resource_reservations_mapper.dart';
import '../../domain/model/resource_data_model.dart';
import '../response/resource_data_response.dart';

extension ResourceDataMapper on ResourceDataResponse {
  ResourceDataModel toDomain() {
    return ResourceDataModel(
      id: id.onNull(),
      attributes: attributes!.toDomain(),
      reservations: reservations!.map((e) => e.toDomain()).toList(),
    );
  }
}
