import 'package:act_hub_mobile/features/resource_details/data/mapper/resource_details_data_mapper.dart';
import '../../domain/models/resource_details_model.dart';
import '../response/resource_details_response.dart';

extension ResourceDetailsMapper on ResourceDetailsResponse {
  ResourceDetailsModel toDomain() {
    return ResourceDetailsModel(data: data!.toDomain());
  }
}
