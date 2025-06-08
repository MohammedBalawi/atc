import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/widgets/pop_cope_widget.dart';
import 'package:flutter/material.dart';
import '../resources/manager_assets.dart';
import 'arrow_back_button.dart';

Widget scaffoldWithImageBackground({
  required Widget child,
  bool isRegisterView = false,
}) {
  return willPopScope(
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: Constants.elevation,
        leading: isRegisterView ? arrowBackButton() : Container(),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: ManagerColors.primaryColor,
      body: Container(
        margin: EdgeInsetsDirectional.only(
          top: ManagerHeight.h12,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ManagerAssets.background,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: child /* add child content here */,
      ),
    ),
  );
}
