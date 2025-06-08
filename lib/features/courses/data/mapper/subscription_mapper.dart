import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/courses/data/mapper/subscription_attributes_mapper.dart';
import '../../domain/models/subscription_model.dart';
import '../response/subscription_response.dart';

extension SubscriptionMapper on SubscriptionResponse {
  SubscriptionModel toDomain() => SubscriptionModel(
        id: this.id.onNull(),
        status: this.status.onNull(),
        subscriptionAttributesModel:
            this.subscriptionAttributesResponse?.toDomain(),
      );
}
