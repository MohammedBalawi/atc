import 'subscription_attributes_model.dart';

class SubscriptionModel {
  int id;
  String status;
  SubscriptionAttributesModel? subscriptionAttributesModel;

  SubscriptionModel({
    required this.id,
    required this.status,
    required this.subscriptionAttributesModel,
  });
}
