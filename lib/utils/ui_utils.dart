import 'package:flutter/material.dart';
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