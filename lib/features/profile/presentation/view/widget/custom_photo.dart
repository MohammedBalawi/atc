// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPhoto extends StatelessWidget {
  const CustomPhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ManagerHeight.h36),
      child: CircleAvatar(
        radius: ManagerRadius.r55,
        child: Image.asset(ManagerAssets.avatar),
      ),
    );
  }
}
