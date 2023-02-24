import 'package:flutter/material.dart';
import 'package:todo/theme/app_dimens.dart';

void showDialogCustom(BuildContext context, Widget child) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimens.d_14)),
            //this right here
            child: Padding(
              padding: EdgeInsets.all(AppDimens.defaultPadding),
              child: child,
            ));
      });
}
