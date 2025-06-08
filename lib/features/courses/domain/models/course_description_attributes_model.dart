class CourseDescriptionAttributesModel {
  String name;
  String description;
  int active;
  int resource_id;
  int hours;
  double price;
  double rate;
  String avatar;
  String start_date;
  String end_date;

  CourseDescriptionAttributesModel({
    required this.name,
    required this.description,
    required this.active,
    required this.resource_id,
    required this.hours,
    required this.price,
    required this.rate,
    required this.avatar,
    required this.start_date,
    required this.end_date,
  });
}
