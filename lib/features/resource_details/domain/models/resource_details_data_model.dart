import 'package:act_hub_mobile/features/resource_details/domain/models/resource_details_attributes_model.dart';
import 'package:act_hub_mobile/features/resource_details/domain/models/resource_reservations_model.dart';

class ResourceDetailsDataModel {
  int? id;
  ResourceDetailsAttributesModel? attributes;
  List<ResourceReservationsModel>? reservations;

  ResourceDetailsDataModel({
    this.id,
    this.attributes,
    this.reservations,
  });
}
