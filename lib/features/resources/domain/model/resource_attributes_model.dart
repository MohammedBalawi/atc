class ResourceAttributesModel {
  String? name;
  int? numberSeats;
  String? thumbnailImage;
  int? priceByHour;
  int? priceByDay;
  int? priceByWeek;
  int? priceByMonth;
  String? description;

  ResourceAttributesModel({
    required this.name,
    required this.numberSeats,
    required this.thumbnailImage,
    required this.priceByHour,
    required this.priceByDay,
    required this.priceByWeek,
    required this.priceByMonth,
    required this.description,
  });
}
