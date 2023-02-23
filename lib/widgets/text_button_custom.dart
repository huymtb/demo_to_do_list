import 'package:flutter/material.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/theme/app_dimens.dart';

class TextButtonCustom extends StatelessWidget {
  final Function onPressed;
  final String btnTitle;
  final bool enable;

  const TextButtonCustom({
    Key? key,
    required this.onPressed,
    required this.btnTitle,
    this.enable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (enable) {
            onPressed.call();
          }
        },
        child: Container(
          padding: EdgeInsets.only(right: AppDimens.defaultPadding),
          alignment: Alignment.centerRight,
          child: Text(
            btnTitle,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: enable ? AppColors.primary : AppColors.grayText),
          ),
        ));
  }
}
