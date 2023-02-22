import 'package:flutter/material.dart';
import 'package:todo/assets/images/images.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/theme/app_dimens.dart';

class AppBarCustom extends StatelessWidget with PreferredSizeWidget {
  final Widget? leadingWidget;
  final List<Widget>? actionWidget;
  final bool isShowLeadingWidget;

  const AppBarCustom({
    Key? key,
    this.actionWidget,
    this.isShowLeadingWidget = true,
    this.leadingWidget,
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
      leading: leadingWidget,
      actions: actionWidget,
    );
  }
}
