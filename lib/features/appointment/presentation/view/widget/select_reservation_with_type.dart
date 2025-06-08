import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes_util.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../../../../core/widgets/text_field.dart';
import '../../controller/stepper_reservation_controller.dart';

LayoutBuilder selectReservationWithType() {
  return LayoutBuilder(
    builder: (BuildContext context, box) {
      return GetBuilder<StepperReservationController>(
        builder: (controller) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: ManagerWidth.w18,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: box.maxWidth - ManagerWidth.w40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(ManagerRadius.r8),
                      border: Border.all(color: ManagerColors.primaryColor),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        buttonStyleData: ButtonStyleData(
                          height: ManagerHeight.h60,
                          padding: EdgeInsetsDirectional.only(
                            end: ManagerWidth.w16,
                          ),
                        ),
                        iconStyleData: IconStyleData(
                          iconSize: ManagerIconSize.s30,
                          iconDisabledColor: ManagerColors.grey,
                          iconEnabledColor: ManagerColors.primaryColor,
                        ),
                        isExpanded: true,
                        underline: SizedBox(),
                        value: controller.priceUnit,
                        items: controller.units
                            .map(
                              (item) => DropdownMenuItem(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: ManagerWidth.w8,
                                      ),
                                      // Add padding start here
                                      child: Text(
                                        "${item.title}",
                                      ),
                                    ),
                                  ],
                                ),
                                value: item.type,
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          controller.changePriceUnit(value);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h60,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.getTitleFromType(controller.priceUnit),
                        style: getMediumTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: ManagerHeight.h14,
                        ),
                        child: Container(
                          width: ManagerWidth.w120,
                          child: textField(
                            labelText: controller
                                .getTitleFromType(controller.priceUnit),
                            controller: controller.timeController,
                            textInputType: TextInputType.number,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ManagerHeight.h20,
                      ),
                      Text(
                        ManagerStrings.startTime,
                        style: getMediumTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.black,
                        ),
                      ),
                      SizedBox(
                        height: ManagerHeight.h10,
                      ),
                      Text(
                        controller.formatDate(controller.selectedDate),
                        style: getMediumTextStyle(
                          fontSize: ManagerFontSize.s20,
                          color: ManagerColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
