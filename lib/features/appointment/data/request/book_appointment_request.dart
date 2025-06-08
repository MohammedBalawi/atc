
class BookAppointmentRequest {
  String pricingOption;
  int pricingInput;
  int resourceId;
  String startDate;
  int paymentMethodId;

  BookAppointmentRequest(
      {required this.pricingOption,
      required this.pricingInput,
      required this.resourceId,
      required this.startDate,
      required this.paymentMethodId});
}
