import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/model/event_model.dart';
import '../../controller/stepper_reservation_controller.dart';

Widget calenderByMonths(List<EventModel> events) {
  return LayoutBuilder(
    builder: (BuildContext context, box) {
      List<EventModel> filteredEvents = [];
      events.forEach((element) {
        element.days.forEach((day) {
          filteredEvents.add(EventModel(start: day, end: element.end, title: element.title, color: element.color, days: element.days));
        });
      });
      return ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: ManagerHeight.h460,
            width: box.maxWidth - ManagerWidth.w20,
            child: CellCalendar(
              daysOfTheWeekBuilder: (dayIndex) {
                final labels = [
                  ManagerStrings.sunday,
                  ManagerStrings.monday,
                  ManagerStrings.tuesday,
                  ManagerStrings.wednesday,
                  ManagerStrings.thursday,
                  ManagerStrings.friday,
                  ManagerStrings.saturday,
                ];
                return Padding(
                  padding: EdgeInsets.only(bottom: ManagerHeight.h4),
                  child: Text(
                    labels[dayIndex],
                    style: TextStyle(
                      color: ManagerColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              },
              onCellTapped: (DateTime date) {
                try{
                  Get.find<StepperReservationController>().setSelectedDate(date);
                  Get.find<StepperReservationController>().nextStep();
                } catch (e) {
                  print(e);
                }
              },
              onPageChanged: (DateTime date, DateTime date2) {},
              monthYearLabelBuilder: (datetime) {
                final year = datetime!.year.toString();
                final month = datetime.month.toString();
                return Padding(
                  padding: EdgeInsets.all(ManagerHeight.h16),
                  child: Text(
                    "$month, $year",
                    style: TextStyle(
                      color: ManagerColors.black,
                      fontSize: ManagerFontSize.s24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
              events: filteredEvents.map(
                (e) {
                  return CalendarEvent(
                    eventName: e.title,
                    eventDate: e.start,
                    eventTextStyle: TextStyle(color: ManagerColors.white),
                    eventBackgroundColor: e.color,
                  );
                },
              ).toList(),
            ),
          ),
        ],
      );
    },
  );
}
