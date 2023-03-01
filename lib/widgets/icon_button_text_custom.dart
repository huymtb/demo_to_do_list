import 'package:flutter/material.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/theme/app_dimens.dart';

class IconButtonTextCustom extends StatelessWidget {
  final Function? onPressed;
  final Function? suffixIconPressed;
  final bool enable;
  final IconData? iconPath;
  final String btnTitle;
  final Widget? icon;

  const IconButtonTextCustom({
    Key? key,
    this.iconPath,
    required this.btnTitle,
    this.enable = false,
    this.onPressed,
    this.suffixIconPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color enableColor = enable ? AppColors.primary : AppColors.grayText;
    return GestureDetector(
      onTap: () {
        onPressed?.call();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppDimens.smallPadding),
        child: Row(
          children: [
            if (icon != null) icon! else Icon(iconPath, color: enableColor),
            SizedBox(width: AppDimens.defaultPadding),
            Expanded(
                child: Text(
              btnTitle,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: enableColor),
            )),
            if (enable)
              GestureDetector(
                onTap: () {
                  suffixIconPressed?.call();
                },
                child: Icon(
                  Icons.close,
                  color: AppColors.grayText,
                  size: AppDimens.d_16,
                ),
              )
          ],
        ),
      ),
    );
  }
}
