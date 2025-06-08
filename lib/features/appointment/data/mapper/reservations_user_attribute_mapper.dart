import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/appointment/data/response/reservations_user_attributes_response.dart';
import 'package:act_hub_mobile/features/appointment/domain/model/reservations_user_attribute_model.dart';

extension ReservationsUserAttributeMapper
    on ReservationsUserAttributesResponse {
  ReservationsUserAttributeModel toDomain() {
    return ReservationsUserAttributeModel(
        resourceName: this.resourceName.onNull(),
        resourceImage: this.resourceImage.onNull(),
        categoryName: this.categoryName.onNull(),
        userName: this.userName.onNull(),
        description: this.description.onNull(),
        resource_id: this.resourceId.onNull(),
        paymentMethod: this.paymentMethod.onNull(),
        price: this.price.onNull(),
        rate: this.rate.onNull(),
        start_date: this.start_date.onNull(),
        end_date: this.end_date.onNull(),
        avatar: this.avatar.onNull(),
        isVerifiedPayment: this.isVerifiedPayment.onNull());
  }
}
