import 'package:flutter/material.dart';
import 'package:todo/assets/images/images.dart';
import 'package:todo/router/router.dart';
import 'package:todo/theme/app_dimens.dart';
import 'package:todo/utils/app_constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: AppConstants.splashDuration), () {
      replace(path: RoutePath.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Images.icApp,
          width: AppDimens.splashImgSize,
          height: AppDimens.splashImgSize,
        ),
      ),
    );
  }
}
