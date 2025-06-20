import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_sizes_util.dart';
import '../../../../core/widgets/scaffold_with_background.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scaffoldWithImageBackground(
      child: Center(
        child: SvgPicture.asset(
          ManagerAssets.logo,
          width: ManagerWidth.w180,
        ),
      ),
    );
  }
}
