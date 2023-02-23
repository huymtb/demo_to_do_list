import 'package:flutter/material.dart';
import 'package:todo/assets/images/images.dart';
import 'package:todo/router/router.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/theme/app_dimens.dart';

class AppBarCustom extends StatelessWidget with PreferredSizeWidget {
  final List<Widget>? actionWidget;
  final bool isShowLeadingWidget;

  const AppBarCustom({
    Key? key,
    this.actionWidget,
    this.isShowLeadingWidget = true,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppDimens.customAppBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0.0,
      title: Image.asset(
        Images.icApp,
        width: AppDimens.appBarLogoSize,
      ),
      centerTitle: true,
      leading: isShowLeadingWidget
          ? IconButton(
              onPressed: () => goBack(),
              icon: const Icon(
                Icons.arrow_back_outlined,
                color: AppColors.primary,
              ))
          : null,
      actions: actionWidget,
    );
  }
}
