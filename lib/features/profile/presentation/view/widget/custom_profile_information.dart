import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomProfileInformation extends StatelessWidget {
  final String imagePath;
  final String textName;
  bool? isLine;

  CustomProfileInformation({super.key, required this.imagePath, required this.textName, this.isLine});

  @override
  Widget build(BuildContext context) {
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
      child: Row(
        children: [
          Container(
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
          Text(
            textName,
            style: getRegularTextStyle(
                fontSize: ManagerFontSize.s14,
                color: ManagerColors.textColorProfile,
                decoration:  isLine == true? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
