import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ManagerWidth.w40,
      height: ManagerHeight.h40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          ManagerRadius.r10,
        ),
      ),
      child: IconButton(
        icon: Icon(Icons.arrow_back_outlined),
        onPressed: () {
        Get.offAllNamed(Routes.main);
        },
      ),
    );
  }
}
