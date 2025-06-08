import 'package:act_hub_mobile/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';

Widget pricePerWidget(
  HomeController controller,
  double price,
  String title,
) {
  return controller.priceByFormat(
    controller.priceFormat(price),
    title,
  );
}
