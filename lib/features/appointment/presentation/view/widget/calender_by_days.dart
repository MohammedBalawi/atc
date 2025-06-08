import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/features/appointment/presentation/controller/stepper_reservation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:get/get.dart';

LayoutBuilder calenderByDays() {
  return LayoutBuilder(
    builder: (BuildContext context, box) {
      return GetBuilder<StepperReservationController>(
        builder: (controller) {
          return ListView(
            shrinkWrap: true,
            children: [
              Container(
                height: ManagerHeight.h460,
                margin: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w18,
                ),
                child: Center(
                  child: DayView(
                    date: controller.selectedDate,
                    onBackgroundTappedDown: (DateTime time) {
                      controller.setSelectedDate(time);
                      controller.nextStep();
                    },
                    events: controller.events
                        .map(
                          (e) => FlutterWeekViewEvent(
                            title: e.title,
                            description: "",
                            start: e.start,
                            end: e.end,
                            backgroundColor: e.color,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
