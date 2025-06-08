import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/courses/data/mapper/subscription_mapper.dart';
import '../../domain/models/subscriptions_model.dart';
import '../response/subscription_response.dart';
import '../response/subscriptions_response.dart';

extension SubscriptionsMapper on SubscriptionsResponse {
  SubscriptionsModel toDomain() => SubscriptionsModel(
      data: this
          .data!
          .map((SubscriptionResponse subscription) => subscription.toDomain())
          .toList(),
      message: this.message.onNull());
}
