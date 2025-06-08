import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomProfile extends StatelessWidget {
  final String imagePath;
  final String textName;
  final void Function()? onTap;

  const CustomProfile(
      {Key? key, required this.imagePath, required this.textName, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                borderRadius: BorderRadius.circular(ManagerRadius.r10),),
            child: SvgPicture.asset(imagePath,color: Colors.black,),
          ),
          Text(
            textName,
            style: getMediumTextStyle(
                fontSize: ManagerFontSize.s16,
                color: ManagerColors.textColorProfile),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
                right: ManagerWidth.w10, left: ManagerWidth.w10),
            child: InkWell(
              child: SvgPicture.asset(ManagerAssets.arrow_setting),
            ),
          )
        ],
      ),
    );
  }
}
