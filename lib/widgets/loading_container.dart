import 'package:flutter/cupertino.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/utils/ui_utils.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: getScreenWidth(context),
        height: getScreenHeight(context),
        color: AppColors.transparent,
        alignment: Alignment.center,
        child: const CupertinoActivityIndicator(
          color: AppColors.primary,
          animating: true,
        ));
  }
}
