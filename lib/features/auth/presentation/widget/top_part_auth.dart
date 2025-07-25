import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../config/constants.dart';
import '../../../../core/resources/manager_assets.dart';

Expanded partTopAuth() {
  return Expanded(
    flex: Constants.authFirstPartFlex,
    child: Center(
      child: SvgPicture.asset(
        ManagerAssets.logo,
      ),
    ),
  );
}