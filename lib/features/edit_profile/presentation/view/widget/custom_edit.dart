import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/features/edit_profile/presentation/controller/edit_profile_controller.dart';
import 'package:act_hub_mobile/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomEdit extends StatelessWidget {
  final String imagePath;
  final Function onChange;
  final Function validator;
  final TextEditingController controllerText;

  CustomEdit({super.key, required this.imagePath, required this.controllerText, required this.onChange, required this.validator,});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileController());
    return Container(
      decoration: BoxDecoration(
        color: ManagerColors.backgroundForm,
        borderRadius: BorderRadius.circular(ManagerRadius.r10),
        boxShadow: [
          BoxShadow(
            color: ManagerColors.greyLight,
            offset: Offset(0.0, 2.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: customTextField(
        onChange: onChange,
        controller: controllerText,

        prefixIcon: Container(
          width: ManagerWidth.w36,
          height: ManagerHeight.h36,
          margin: EdgeInsets.symmetric(
              horizontal: ManagerWidth.w14, vertical: ManagerHeight.h14),
          padding: EdgeInsets.symmetric(
              horizontal: ManagerWidth.w4, vertical: ManagerHeight.h4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ManagerRadius.r10),
              color: ManagerColors.white),
          child: SvgPicture.asset(imagePath,color: ManagerColors.black,),
        ),
      ),
    );
  }
}
