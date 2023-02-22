import 'package:flutter/material.dart';
import 'package:todo/utils/ui_utils.dart';

class SizeConfig {
  static late double scaleFactor;

  void init(BuildContext context) {
    scaleFactor = scaleFactorOf(context);
  }
}