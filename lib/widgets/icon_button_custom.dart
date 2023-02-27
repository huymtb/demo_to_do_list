import 'package:flutter/material.dart';
import 'package:todo/theme/app_dimens.dart';

class IconButtonCustom extends StatelessWidget {
  final Function? onPressed;
  final IconData icon;

  const IconButtonCustom({
    Key? key,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimens.smallPadding),
      child: GestureDetector(
        onTap: () {
          onPressed?.call();
        },
        child: Icon(icon),
      ),
    );
  }
}
