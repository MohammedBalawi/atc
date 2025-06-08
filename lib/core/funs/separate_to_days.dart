
List<DateTime> getDateRange(String startDateStr, String endDateStr) {
  DateTime startDate = DateTime.parse(startDateStr);
  DateTime endDate = DateTime.parse(endDateStr);

  List<DateTime> dateList = [];
  for (DateTime date = startDate; date.isBefore(endDate) || date.isAtSameMomentAs(endDate); date = date.add(Duration(days: 1))) {
    dateList.add(date);
  }

  return dateList;
}