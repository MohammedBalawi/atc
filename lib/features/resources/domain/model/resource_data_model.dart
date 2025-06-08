import 'package:act_hub_mobile/features/resources/domain/model/resource_attributes_model.dart';
import 'resource_reservations_model.dart';

class ResourceDataModel {
  int id;
  ResourceAttributesModel attributes;
  List<ResourceReservationsModel> reservations;

  ResourceDataModel({
   required this.id,
   required this.attributes,
   required this.reservations,
  });
}
