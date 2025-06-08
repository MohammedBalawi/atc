import '../../../../core/base_model/base_model.dart';
import 'subscription_model.dart';

class SubscriptionsModel extends BaseModel {
  List<SubscriptionModel> data;

  SubscriptionsModel({required this.data, required super.message});
}
