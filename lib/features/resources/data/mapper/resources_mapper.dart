import 'package:act_hub_mobile/features/resources/data/mapper/resource_data_mapper.dart';
import '../../domain/model/resources_model.dart';
import '../response/resources_response.dart';

extension ResourcesMapper on ResourcesResponse {
  ResourcesModel toDomain() {
    return ResourcesModel(
      data: this.data!.map((e) => e.toDomain()).toList(),
    );
  }
}
