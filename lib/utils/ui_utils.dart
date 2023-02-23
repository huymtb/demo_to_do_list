import 'package:flutter/cupertino.dart';
import 'package:todo/theme/app_dimens.dart';
import 'package:todo/utils/size_config.dart';

void hideKeyBoard(BuildContext context, {FocusNode? node}) {
  FocusScope.of(context).requestFocus(node ?? FocusNode());
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

var _scaleFactor = 0.0;

double scaleFactorOf(BuildContext context) {
  if (_scaleFactor == 0) {
    _scaleFactor =
        MediaQuery.of(context).size.width / AppDimens.defaultScreenWidth;
  }
  return _scaleFactor;
}

double getDimension(double value) {
  return value * SizeConfig.scaleFactor;
}

void showBottomSheetCustom(BuildContext context, Widget child) {
  showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: AppDimens.bottomSheetHeight,
          padding: EdgeInsets.only(top: AppDimens.smallPadding),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: child,
          ),
        );
      });
}
