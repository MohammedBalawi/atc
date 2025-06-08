import 'package:act_hub_mobile/core/validator/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppSearchController extends GetxController{
  late TextEditingController searchController;
  final FieldValidator validator = FieldValidator();

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
  }
  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}