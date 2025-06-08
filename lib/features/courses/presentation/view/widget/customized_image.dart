import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  ImageProvider<Object> image;

  CustomImage({required this.image, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: ManagerHeight.h375,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
